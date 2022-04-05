package com.ecommerce.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author arif
 */
@Entity
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int catId;
    private String catTitle;
    private String catDescription;
    @OneToMany(mappedBy = "pCategory")
    private List<Product> products = new ArrayList<>();

    public Category() {
    }

    public Category(int catId, String catTitle, String catDescription) {
        this.catId = catId;
        this.catTitle = catTitle;
        this.catDescription = catDescription;
    }

    public Category(String catTitle, String catDescription, List<Product> products) {
        this.catTitle = catTitle;
        this.catDescription = catDescription;
        this.products = products;
    }

    public Category(String catTitle, String catDescription) {
        this.catTitle = catTitle;
        this.catDescription = catDescription;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatTitle() {
        return catTitle;
    }

    public void setCatTitle(String catTitle) {
        this.catTitle = catTitle;
    }

    public String getCatDescription() {
        return catDescription;
    }

    public void setCatDescription(String catDescription) {
        this.catDescription = catDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
    
    

    @Override
    public String toString() {
        return "Category{" + "catId=" + catId + ", catTitle=" + catTitle + ", catDescription=" + catDescription + '}';
    }

}
