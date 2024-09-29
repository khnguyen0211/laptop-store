package com.project.store.controllers.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.store.domain.Product;
import com.project.store.services.ProductService;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("admin/product")
    public String getAllProductPage(Model model) {
        List<Product> productList = this.productService.handleFindAllProduct();
        model.addAttribute("productList", productList);
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
}
