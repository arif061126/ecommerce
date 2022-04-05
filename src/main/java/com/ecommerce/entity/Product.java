package com.ecommerce.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author arif
 */
@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length = 3000)
    private String pDescription;
    private String pPhoto;
    private double pPrice;
    private int pDiscount;
    private int pQuantity;
    @ManyToOne
    private Category pCategory;

    public Product() {
    }

    public Product(int pId, String pName, String pDescription, String pPhoto, double pPrice, int pDiscount, int pQuantity) {
        this.pId = pId;
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
    }

    public Product(String pName, String pDescription, String pPhoto, double pPrice, int pDiscount, int pQuantity) {
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
    }

    public Product(String pName, String pDescription, String pPhoto, double pPrice, int pDiscount, int pQuantity, Category pCategory) {
        this.pName = pName;
        this.pDescription = pDescription;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pCategory = pCategory;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDescription() {
        return pDescription;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public double getpPrice() {
        return pPrice;
    }

    public void setpPrice(double pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getpCategory() {
        return pCategory;
    }

    public void setpCategory(Category pCategory) {
        this.pCategory = pCategory;
    }

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDescription=" + pDescription + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }

    //Calculate discount for all products:
    public double getPriceAfterDiscount() {
        return getpPrice() - getpDiscount();

    }

}
