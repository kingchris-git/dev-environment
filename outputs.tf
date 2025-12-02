output "webapp_url" {
  value = azurerm_linux_web_app.dev_webapp.default_hostname
}

output "subnet_id" {
  value = azurerm_subnet.dev_subnet.id
}
