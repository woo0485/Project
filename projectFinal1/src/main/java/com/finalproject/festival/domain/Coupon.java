package com.finalproject.festival.domain;

import java.sql.Date;

public class Coupon {
		
		private int couponno;
		private String couponname;
		private int coupondiscountrate;


		public Coupon () {}


		public Coupon(int couponno, String couponname, int coupondiscountrate) {
			super();
			this.couponno = couponno;
			this.couponname = couponname;
			this.coupondiscountrate = coupondiscountrate;
		}


		public int getCouponno() {
			return couponno;
		}


		public void setCouponno(int couponno) {
			this.couponno = couponno;
		}


		public String getCouponname() {
			return couponname;
		}


		public void setCouponname(String couponname) {
			this.couponname = couponname;
		}


		public int getCoupondiscountrate() {
			return coupondiscountrate;
		}


		public void setCoupondiscountrate(int coupondiscountrate) {
			this.coupondiscountrate = coupondiscountrate;
		}
		
		
}
