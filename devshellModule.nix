bud:
{ pkgs, self, ... }:
let reboudBud = bud self;
in
{
  _file = toString ./.;
  commands = [{
    category = "runtime";
    package = reboudBud { inherit pkgs; };
  }];
}
