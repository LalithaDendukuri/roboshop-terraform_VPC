vpc = {
  main = {
    cidr = "10.0.0.0/16"
    subnets = {
      public ={
        public1= { cidr="10.0.0.0/24", az="us-east-1a" }
        public2= { cidr="10.0.1.0/24", az="us-east-1a" }
      }
      app ={
        app1= { cidr="10.0.2.0/24", az="us-east-1a" }
        app2= { cidr="10.0.3.0/24", az="us-east-1a" }
      }
      db ={
        db1= { cidr="10.0.4.0/24", az="us-east-1a" }
        db2= { cidr="10.0.5.0/24", az="us-east-1a" }
      }
    }
  }
}
default_vpc_id = "vpc-04c47983b6989f645"
default_vpc_cidr ="172.31.0.0/16"
default_route_table_id="rtb-052c61ad81a94fe80"

tags = {
  company_name  = "ABC Tech"
  business_unit = "Ecommerce"
  project_name  = "robotshop"
  cost_center   = "ecom_rs"
  created_by    = "terraform"
}
env = "dev"