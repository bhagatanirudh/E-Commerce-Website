package com.eazydeals.entities;

public class Product {

	private int productId;
    private String productName;
    private String productDescription;
    private float productPrice;
    private int productDiscount;
    private int productQunatity;
    private String productImages;
    private int categoryId;
    
	public Product() {
		super();
	}
	
	public Product(int productId, String productName, String productDescription, float productPrice,
			int productDiscount, int productQunatity, String productImages, int categoryId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
		this.categoryId = categoryId;
	}

	public Product(String productName, String productDescription, float productPrice, int productDiscount,
			int productQunatity, String productImages) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
	}

	public Product(String productName, String productDescription, float productPrice, int productDiscount,
			int productQunatity, String productImages, int categoryId) {
		super();
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
		this.productImages = productImages;
		this.categoryId = categoryId;
	}
	
	public Product(int productId, String productName, float productPrice, int productDiscount, int productQunatity) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQunatity = productQunatity;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public float getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(float productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQunatity() {
		return productQunatity;
	}

	public void setProductQunatity(int productQunatity) {
		this.productQunatity = productQunatity;
	}

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	//calculate price of product by applying discount
    public int getProductPriceAfterDiscount(){
        int discount = (int) ((this.getProductDiscount()/100.0) * this.getProductPrice());
        return (int) (this.getProductPrice() - discount);
    }
	
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount
				+ ", productQunatity=" + productQunatity + ", productImages=" + productImages + ", categoryId="
				+ categoryId + "]";
	}
    
    
}
