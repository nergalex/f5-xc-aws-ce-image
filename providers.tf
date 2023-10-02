#provider "volterra" {
#  url           = var.f5xc_api_url
#  api_cert      = var.f5xc_api_cert
#  api_key       = var.f5xc_api_key
#  alias         = "default"
#}

provider "aws" {
  region      = var.f5xc_aws_region
#  access_key  = var.aws_access_key_id
#  secret_key  = var.aws_secret_access_key
  access_key  = "ASIAZLNXUXZZX3BIPXVE"
  secret_key  = "dr1wEm91E15FZbwPCZ1PLpaf4ptaVP+whP+XZqBA"
  token       = "IQoJb3JpZ2luX2VjEAkaCXVzLWVhc3QtMSJIMEYCIQCy4I5mIHKiFioWx1qrFuQcGwwcjmCUDNNhNzdvkWOxkgIhAImb4zHI0AqNZyX2s5Tr/VytzHKBt2ZWJAln+xeyCb+bKowDCBEQBBoMNjQzMDE5NjE5OTU1Igynd/+9r1L6ZOR/7v8q6QLMQYNy1XFrCRwX1P2zNAZYLXwdonfWOOlJ5UHobL7rZWf8sw8YzZ9R1WiWxrGeegnRdlPrnM8mzci5QjWjpF6tzb+KzAniQlF0THP7nvtiQargE1D+/xo2/1nv6V5Akt06OQ0I+cCgkACT9rRyjvCYzQToK5DqJAVhJH9CavBdLZDONGQ+XJ/fVRVXnPodx8qv6jDeHiM02NvcqNR+SbndRCHmU2N7rwuqq/+ek7OGrWkl7YHsn+84zXaWy5tnRpdvCPe6Zdpxn3BnHtD82pYCF0NXETQmOkpx4J6wbZLy7F6ycz0HHIGT7tggYkD4h22F1r9AmROEJgX8ifnjqys1AvNIfqxPXJed5+XuhJExSDPpxzvX4QiRdwD6Gcr+rIWxevt31AAYIqexXZOl+sbkzj0UZbZbeIuo85uP87X1dbZLX4FrK10Py8Wyk1Lh0bNU2GzoLOT6cIeAyuz70tbH/GLHuHaNFiHLMPn26agGOqUBUjvrUUztTAhvxh3btt74EY41fp5Sx0DQeo05DeLKAEfnswAIpDGtjxVLfjUlPjDuQ1XgHxodMjTt0kj4bCXlxD7yN68jB+u7p1456sZ1mBAzHsI9+qBLvYNwdJAa389DuMN+cAgzf21Uk40SwO0OFm2cYxUf8hlumB5+4m3okGKAjkNp8MqLS7TEnVYzGhIEWRtTHzcQ6Gp8iiA8WPFLf3tiLCEr"
  alias       = "default"
}