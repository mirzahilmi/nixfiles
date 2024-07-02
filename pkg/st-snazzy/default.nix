{
  system,
  inputs,
  fetchpatch,
}:
inputs.st.packages."${system}".st-snazzy.override {
  conf = builtins.readFile ./conf.h;
  patches = [
    # (fetchpatch {
    #   url = "https://st.suckless.org/patches/open_copied_url/st-openclipboard-20220217-0.8.5.diff";
    #   sha256 = "sha256-PBhLz/e/EMvihTRPnJr8qD4z4Z0hXxEfYGo2DcrbF/4=";
    # })
  ];
}
