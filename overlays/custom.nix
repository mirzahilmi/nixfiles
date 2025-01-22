{
  finalPkgs,
  prevPkgs,
}: {
  btop = prevPkgs.btop.override {cudaSupport = true;};
}
