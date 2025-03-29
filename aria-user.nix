{ lib, config, pkgs, ...}:

{
 options = {
 
 };

 config = {
  users.users.aria = {
   isNormalUser = true;
  };
 };
}
