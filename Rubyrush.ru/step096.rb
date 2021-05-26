shopping_list_hardware = {
  :apple => 6,
  :milk => 6,
  :chocolate => 2,
}
shopping_list_grocery = {
  :nails => 100,
  :hummer => 1,
  :wood => 10
}

p shopping_list_hardware
p shopping_list_grocery

p shopping_list_hardware.merge(shopping_list_grocery)
