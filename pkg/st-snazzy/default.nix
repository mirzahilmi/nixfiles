{
  system,
  inputs,
}:
inputs.st.packages."${system}".st-snazzy.override {
  conf = builtins.readFile ./conf.h;
}
