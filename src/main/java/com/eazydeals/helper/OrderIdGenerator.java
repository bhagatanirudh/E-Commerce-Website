package com.eazydeals.helper;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderIdGenerator {

	public static String getOrderId() {
		String orderId = "";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		orderId = sdf.format(new Date());
		orderId = "ORD-" + orderId;

		return orderId;
	}
}
