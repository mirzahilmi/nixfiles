{
  inputs,
  pkgs,
}:
inputs.st.packages."${pkgs.system}".st-snazzy.override {
  conf = builtins.readFile ./conf.h;
}
