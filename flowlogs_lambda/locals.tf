locals {
  lightlytics_api_url_collection = var.pvl_subnets_ids == [] ? "https://${var.environment}.${var.domain_name}" : "https://${var.environment}-${data.aws_region.current.name}-pvl.${var.domain_name}"
}

locals {
  lambda_source_code_bucket = "${var.lightlytics_bucket}-${data.aws_region.current.name}"
}

locals {
  lambda_flow_logs_s3_source_code_key = var.flowlogs-lambda["${var.type_env}-collection_lambda_flowlogs"]
}

locals {
  lambda_layer_source_code_key = var.flowlogs-lambda["${var.type_env}-collection_lambda_layer"]
}

locals {
  pvl_security_groups = var.create_pvl_vpc == true ? [aws_security_group.allow_443_outbound[0].id] : var.pvl_security_group_ids
}

locals {
  pvl_subnets = var.create_pvl_vpc == true ? [aws_subnet.lightlytics-subnet-pvl1[0].id, aws_subnet.lightlytics-subnet-pvl2[0].id] : var.pvl_subnets_ids
}

locals {
  pvl_vpc = var.create_pvl_vpc == true ? aws_vpc.lightlytics-vpc-pvl[0].id : var.pvl_vpc_id
}
