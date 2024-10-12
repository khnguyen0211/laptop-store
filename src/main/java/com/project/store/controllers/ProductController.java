package com.project.store.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.store.domain.Product;
import com.project.store.domain.Product_;
import com.project.store.domain.dtos.ProductCriteriaDto;
import com.project.store.services.ProductService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("admin/product")
    public String getAllProductPage(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Product> pageProduct = this.productService.handleFindAllProduct(pageable);
        List<Product> products = pageProduct.getContent();
        int totalPage = pageProduct.getTotalPages();
        int currentPage = pageProduct.getNumber();
        model.addAttribute("currentPage", currentPage + 1);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("productList", products);
        return "admin/product/table-product";
    }

    @GetMapping("admin/product/create")
    public String createProductPage(Model model) {
        model.addAttribute("createProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("admin/product/create")
    public String createProduct(@ModelAttribute("createProduct") Product createProduct) {
        this.productService.handleSaveProduct(createProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/products")
    public String getProductsPage(Model model, ProductCriteriaDto productCriteriaDto, HttpServletRequest request) {
        int page = 1;
        if (productCriteriaDto.getPage() != null) {
            if (productCriteriaDto.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDto.getPage().get());
            }
        }

        Pageable pageable = PageRequest.of(page - 1, 10);

        if (productCriteriaDto.getSort() != null && productCriteriaDto.getSort().isPresent()) {
            String sort = productCriteriaDto.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDto);

        List<Product> products = !prs.getContent().isEmpty() ? prs.getContent()
                : new ArrayList<>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        Page<Product> pageProduct = this.productService.handleFindAllProductSpec(pageable, 2000000.0);
        int totalPage = pageProduct.getTotalPages();
        int currentPage = pageProduct.getNumber();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", currentPage + 1);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("totalPage", totalPage);
        return "client/product/products";
    }

    @GetMapping("products/{id}")
    public String getProductByIdPage(Model model, @PathVariable("id") long id) {
        Product product = this.productService.handleFindProductById(id);
        Pageable pageable = PageRequest.of(0, 5);
        Page<Product> pageProduct = this.productService.handleFindAllProduct(pageable);
        List<Product> products = pageProduct.getContent();
        model.addAttribute("product", product);
        model.addAttribute("products", products);
        return "client/product/detail";
    }
}
