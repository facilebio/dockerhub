installed.pkgs <- rownames(installed.packages())
required.pkgs <- readLines("/tmp/base-packages.txt")
install.me <- setdiff(required.pkgs, installed.pkgs)

# BiocManager::install(install.me, update = FALSE, ask = FALSE)
pak::pkg_install(install.me, upgrade = TRUE, ask = FALSE)

