package com.project.store.controllers;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.store.domain.Product;
import com.project.store.services.ProductService;

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
    public String getMethodName(Model model,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "name", required = false, defaultValue = "") String name
    ) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Product> pageProduct = this.productService.handleFindAllProductSpec(pageable, 2000000.0);
        List<Product> products = pageProduct.getContent();
        int totalPage = pageProduct.getTotalPages();
        int currentPage = pageProduct.getNumber();
        model.addAttribute("products", products);
        model.addAttribute("currentPage", currentPage + 1);
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
