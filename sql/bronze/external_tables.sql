CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.customers_raw` 
(
  customer_id STRING,
  customer_unique_id STRING,
  customer_zip_code_prefix STRING,
  customer_city STRING,
  customer_state STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/olist_customers_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.orders_raw`
(
  order_id                      STRING,
  customer_id                   STRING,
  order_status                  STRING,
  order_purchase_timestamp      STRING,
  order_approved_at             STRING,
  order_delivered_carrier_date  STRING,
  order_delivered_customer_date STRING,
  order_estimated_delivery_date STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/olist_orders_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.order_items_raw`
(
  order_id             STRING,
  order_item_id        STRING,
  product_id           STRING,
  seller_id            STRING,
  shipping_limit_date  STRING,
  price                STRING,
  freight_value        STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/olist_order_items_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.payments_raw`
(
  order_id              STRING,
  payment_sequential    STRING,
  payment_type          STRING,
  payment_installments  STRING,
  payment_value         STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/olist_order_payments_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.reviews_raw`
(
  review_id               STRING,
  order_id                STRING,
  review_score            STRING,
  review_comment_title    STRING,
  review_comment_message  STRING,
  review_creation_date    STRING,
  review_answer_timestamp STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  allow_jagged_rows = true,
  allow_quoted_newlines = true,
  uris = ['gs://olist-analytics-bucket/olist_order_reviews_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.products_raw`
(
  product_id                 STRING,
  product_category_name      STRING,
  product_name_lenght        STRING,
  product_description_lenght STRING,
  product_photos_qty         STRING,
  product_weight_g           STRING,
  product_length_cm          STRING,
  product_height_cm          STRING,
  product_width_cm           STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/olist_products_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.sellers_raw`
(
  seller_id            STRING,
  seller_zip_code_prefix STRING,
  seller_city          STRING,
  seller_state         STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/olist_sellers_dataset.csv']
);

CREATE OR REPLACE EXTERNAL TABLE `olist-analytics-layer.olist_bronze.category_translation_raw`
(
  product_category_name         STRING,
  product_category_name_english STRING
)
OPTIONS (
  format = 'CSV',
  skip_leading_rows = 1,
  uris = ['gs://olist-analytics-bucket/product_category_name_translation.csv']
);