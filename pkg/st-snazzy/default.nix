{
  inputs,
  pkgs,
}:
inputs.st.packages."${pkgs.system}".st-snazzy.override {
  conf = builtins.readFile ./conf.h;
  patches = [
    (pkgs.fetchpatch {
      url = "https://st.suckless.org/patches/dynamic-cursor-color/st-dynamic-cursor-color-0.9.diff";
      sha256 = "sha256-JugrLvbnacZ6SfVl+V6tLM30LEKWBnRi6WM9oJR9OAA";
    })
  ];
}
