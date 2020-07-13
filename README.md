# labtools

A package of useful R functions used in the Gresham Lab for data analysis

to load package in R:

>library(devtools)

>install_github("GreshamLab/labtools", build_vignettes = TRUE)

to view the vignette use:

>help(package = 'labtools', help_type = 'html')

where you can see the currently available functions:

1. gff_from_snapgene_features()
2. hello()
3. std_err()
4. yeast_common_to_sgd()
5. yeast_common_to_systematic()
6. yeast_gene_names()
7. yeast_r64_to_systematic()
8. yeast_sgd_to_common()
9. yeast_sgd_to_systematic()
10. yeast_systematic_to_common()
11. yeast_systematic_to_sgd()

for information on how to run a specific function:

>?yeast_systematic_to_common
