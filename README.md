
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggnewscale <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R build
status](https://github.com/eliocamp/ggnewscale/workflows/R-CMD-check/badge.svg)](https://github.com/eliocamp/ggnewscale/actions)
[![Codecov test
coverage](https://codecov.io/gh/eliocamp/ggnewscale/branch/master/graph/badge.svg)](https://app.codecov.io/gh/eliocamp/ggnewscale?branch=master)
[![DOI](https://zenodo.org/badge/161934647.svg)](https://zenodo.org/badge/latestdoi/161934647)
[![CRAN
status](http://www.r-pkg.org/badges/version/ggnewscale)](https://cran.r-project.org/package=ggnewscale)
<!-- badges: end -->

`ggnewscale` tries to make it painless to use multiple scales in
`ggplot2`. Although originally intended to use with colour and fill, it
should work with any `aes`, such as `shape`, `linetype` and the rest.

[ggnewscale: spend 400% more time tweaking your
ggplot!](https://web.archive.org/web/20220511154749/https://twitter.com/mattansb/status/1524415881920528385)

For another way of defining multiple scales, you can also try
[relayer](https://github.com/clauswilke/relayer).

## How to install

You can install ggnewscale from CRAN with:

``` r
install.packages("ggnewscale")
```

Or the development version with:

``` r
# install.packages("devtools")
devtools::install_github("eliocamp/ggnewscale")
```

## How to cite

If you use ggnewscale in a publication, I’ll be grateful if you cited
it. To get the suggested citation for this (and any other R package) you
can use:

``` r
citation("ggnewscale")
#> To cite ggnewscale in publications use:
#> 
#>   Campitelli E (????). _ggnewscale: Multiple Fill and Colour Scales in
#>   'ggplot2'_. doi:10.5281/zenodo.2543762
#>   <https://doi.org/10.5281/zenodo.2543762>, R package version 0.5.0.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{R-ggnewscale,
#>     title = {ggnewscale: Multiple Fill and Colour Scales in 'ggplot2'},
#>     author = {Elio Campitelli},
#>     note = {R package version 0.5.0},
#>     doi = {10.5281/zenodo.2543762},
#>   }
```

If you use knitr, [you can automate
this](https://bookdown.org/yihui/rmarkdown-cookbook/write-bib.html) with

``` r
knitr::write_bib(c("ggnewscale"), "packages.bib")
```

And then add citations with `@R-ggnewscale`.

<details>
<summary>
Click to see a list of some publications that have cited ggnewscale.
Thanks!
</summary>

\[1\] *Application of Rapid Diagnostics and Next-Generation Amplicon
Sequencing to Address Product Quality in the Food Industry - ProQuest*.
<https://www.proquest.com/openview/3238c502f2c2d6c8bef42493c35d6a47/1?pq-origsite=gscholar&cbl=18750&diss=y>.
Jun. 28, 2023. (Visited on 06/28/2023).

\[2\] *Integrated Analysis of Hub Genes and miRNA- Transcription
Factor-Hub Gene Interaction Network in Necrotizing Enterocolitis*.
<https://www.researchsquare.com>. Apr. 2023. DOI:
10.21203/rs.3.rs-2756663/v1. (Visited on 04/12/2023).

\[3\] *Nutrigonometry II: Experimental Strategies to Maximize
Nutritional Information in Multidimensional Performance Landscapes -
Morimoto - 2022 - Ecology and Evolution - Wiley Online Library*.
<https://onlinelibrary.wiley.com/doi/10.1002/ece3.9174>. Aug. 08, 2022.
(Visited on 08/08/2022).

\[4\] *Rifaximin Prophylaxis Causes Resistance to the Last-Resort
Antibiotic Daptomycin medRxiv*.
<https://www.medrxiv.org/content/10.1101/2023.03.01.23286614v1>.
Mar. 10, 2023. (Visited on 03/10/2023).

\[5\] *Study on the Mechanism of Lung Ischemia-Reperfusion Injury Based
on Bioinformatics*. <https://www.researchsquare.com>. Jul. 2023. DOI:
10.21203/rs.3.rs-3088383/v1. (Visited on 07/19/2023).

\[6\] *Using Stochastic Point Pattern Analysis to Track Regional
Orientations of Magmatism During the Transition to Cenozoic Extension
and Rio Grande Rifting, Southern Rocky Mountains - Rosera - 2024 -
Tectonics - Wiley Online Library*.
<https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2023TC007902>. Feb.
12, 2024. (Visited on 02/12/2024).

\[7\] E. Akhil Prakash, T. Hromádková, T. Jabir, et al. “Dissemination
of Multidrug Resistant Bacteria to the Polar Environment - Role of the
Longest Migratory Bird Arctic Tern (Sterna Paradisaea)”. In: *Science of
The Total Environment* (Dec. 2021), p. 152727. ISSN: 0048-9697. DOI:
10.1016/j.scitotenv.2021.152727. (Visited on 01/03/2022).

\[8\] R. AminiTabrizi, R. M. Wilson, J. D. Fudyma, et al. “Controls on
Soil Organic Matter Degradation and Subsequent Greenhouse Gas Emissions
Across a Permafrost Thaw Gradient in Northern Sweden”. In: *Front. Earth
Sci.* 8 (2020). ISSN: 2296-6463. DOI: 10.3389/feart.2020.557961.
(Visited on 03/03/2021).

\[9\] D. Baker, J. Lauer, A. Ortega, et al. “Effects of Phycosphere
Bacteria on Their Algal Host Are Host Species-Specific and Not
Phylogenetically Conserved”. In: *Microorganisms* 11.1 (Jan. 2023), p.
62. ISSN: 2076-2607. DOI: 10.3390/microorganisms11010062. (Visited on
12/28/2022).

\[10\] L. Baumgarten, B. Pieper, B. Song, et al. “Pan-European Study of
Genotypes and Phenotypes in the Arabidopsis Relative Cardamine Hirsuta
Reveals How Adaptation, Demography, and Development Shape Diversity
Patterns”. In: *PLOS Biology* 21.7 (Jul. 2023), p. e3002191. ISSN:
1545-7885. DOI: 10.1371/journal.pbio.3002191. (Visited on 07/24/2023).

\[11\] J. Bosch, P. T. Dobbler, T. Větrovský, et al. “Decomposition of
Fomes Fomentatius Fruiting Bodies - Transition of Healthy Living Fungus
into a Decayed Bacteria-Rich Habitat Is Primarily Driven by Arthropoda”.
In: *FEMS Microbiology Ecology* (Mar. 2024), p. fiae044. ISSN:
0168-6496. DOI: 10.1093/femsec/fiae044. (Visited on 04/05/2024).

\[12\] J. Botero, C. Peeters, E. De Canck, et al. “A Comparative Genomic
Analysis of \_Fructobacillus\_\_ Evanidus\_ Sp. Nov. from Bumble Bees”.
In: *Systematic and Applied Microbiology* (Mar. 2024), p. 126505. ISSN:
0723-2020. DOI: 10.1016/j.syapm.2024.126505. (Visited on 03/29/2024).

\[13\] J. Botero, A. S. Sombolestani, M. Cnockaert, et al. “A
Phylogenomic and Comparative Genomic Analysis of Commensalibacter, a
Versatile Insect Symbiont”. In: *Animal Microbiome* 5.1 (Apr. 2023), p.
25. ISSN: 2524-4671. DOI: 10.1186/s42523-023-00248-6. (Visited on
05/02/2023).

\[14\] I. N. Boys, A. G. Johnson, M. R. Quinlan, et al. “Structural
Homology Screens Reveal Host-Derived Poxvirus Protein Families Impacting
Inflammasome Activity”. In: *Cell Reports* 42.8 (Aug. 2023), p. 112878.
ISSN: 2211-1247. DOI: 10.1016/j.celrep.2023.112878. (Visited on
07/30/2023).

\[15\] I. N. Boys, A. G. Johnson, M. Quinlan, et al. *Structural
Homology Screens Reveal Poxvirus-Encoded Proteins Impacting
Inflammasome-Mediated Defenses*. Feb. 2023. DOI:
10.1101/2023.02.26.529821. (Visited on 03/02/2023).

\[16\] S. Bruns, S. Al Hameli, E. Sulanke, et al. “A Wandering Wedgefish
Illustrates the Need for Cooperative Elasmobranch Conservation in the
Arabian Gulf”. In: *Environ Biol Fish* (Mar. 2024). ISSN: 1573-5133.
DOI: 10.1007/s10641-024-01531-4. (Visited on 03/09/2024).

\[17\] N. H. Buitendijk and B. A. Nolet. “Timing and Intensity of Goose
Grazing: Implications for Grass Height and First Harvest”. In:
*Agriculture, Ecosystems & Environment* 357 (Nov. 2023), p. 108681.
ISSN: 0167-8809. DOI: 10.1016/j.agee.2023.108681. (Visited on
07/25/2023).

\[18\] L. F. Camacho, J. E. Ávila, and C. Flórez-V. “Mechanisms
Preventing Animals to Achieve Buoyant Flight”. In: *Journal of Natural
History* 58.9-12 (Mar. 2024), pp. 440-448. ISSN: 0022-2933. DOI:
10.1080/00222933.2024.2322178. (Visited on 03/29/2024).

\[19\] M. E. Carey, Z. A. Dyson, D. J. Ingle, et al. “Global Diversity
and Antimicrobial Resistance of Typhoid Fever Pathogens: Insights from a
Meta-Analysis of 13,000 Salmonella Typhi Genomes”. In: *eLife* 12
(Sep. 2023), p. e85867. ISSN: 2050-084X. DOI: 10.7554/eLife.85867.
(Visited on 09/19/2023).

\[20\] H. Chen, G. Chew, N. Devapragash, et al. “The E3 Ubiquitin Ligase
WWP2 Regulates Pro-Fibrogenic Monocyte Infiltration and Activity in
Heart Fibrosis”. In: *Nat Commun* 13.1 (Nov. 2022), p. 7375. ISSN:
2041-1723. DOI: 10.1038/s41467-022-34971-6. (Visited on 12/03/2022).

\[21\] T. Chen, Y. Lei, M. Li, et al. “Network Pharmacology to Unveil
the Mechanism of Suanzaoren Decoction in the Treatment of Alzheimer’s
with Diabetes”. In: *Hereditas* 161.1 (Jan. 2024), p. 2. ISSN:
1601-5223. DOI: 10.1186/s41065-023-00301-z.

\[22\] H. Danlin, T. Chao, S. Zhenjie, et al. “Potential Synergistic
Regulation of Hsp70 and Antioxidant Enzyme Genes in Pyropia Yezoensis
under High Temperature Stress”. In: *Algal Research* (Jan. 2024), p.
103375. ISSN: 2211-9264. DOI: 10.1016/j.algal.2023.103375. (Visited on
01/16/2024).

\[23\] X. Ding, K. Liu, Q. Yan, et al. “Sugar and Organic Acid
Availability Modulate Soil Diazotroph Community Assembly and Species
Co-Occurrence Patterns on the Tibetan Plateau”. In: *Appl Microbiol
Biotechnol* (Oct. 2021). ISSN: 1432-0614. DOI:
10.1007/s00253-021-11629-9. (Visited on 10/21/2021).

\[24\] T. G. Drivas, A. Lucas, and M. D. Ritchie. “eQTpLot: A
User-Friendly R Package for the Visualization of Colocalization between
eQTL and GWAS Signals”. In: *BioData Mining* 14.1 (Jul. 2021), p. 32.
ISSN: 1756-0381. DOI: 10.1186/s13040-021-00267-6. (Visited on
07/21/2021).

\[25\] K. Giannakis, S. J. Arrowsmith, L. Richards, et al. “Evolutionary
Inference across Eukaryotes Identifies Universal Features Shaping
Organelle Gene Retention”. In: *Cell Systems* (Sep. 2022). ISSN:
2405-4712. DOI: 10.1016/j.cels.2022.08.007. (Visited on 09/19/2022).

\[26\] R. B. Gorodnichev, M. A. Kornienko, M. V. Malakhova, et al.
“Isolation and Characterization of the First Zobellviridae Family
Bacteriophage Infecting Klebsiella Pneumoniae”. In: *International
Journal of Molecular Sciences* 24.4 (Jan. 2023), p. 4038. ISSN:
1422-0067. DOI: 10.3390/ijms24044038. (Visited on 02/20/2023).

\[27\] M. C. Granovetter, L. Ettensohn, and M. Behrmann. “With Childhood
Hemispherectomy, One Hemisphere Can Support-But Is Suboptimal for-Word
and Face Recognition”. In: *bioRxiv* (Nov. 2020), p. 2020.11.06.371823.
DOI: 10.1101/2020.11.06.371823. (Visited on 03/03/2021).

\[28\] C. Higgs, L. S. Kumar, K. Stevens, et al. “Comparison of
Contemporary Invasive and Non-Invasive Streptococcus Pneumoniae Isolates
Reveals New Insights into Circulating Anti-Microbial Resistance
Determinants”. In: *Antimicrobial Agents and Chemotherapy* 0.0
(Oct. 2023), pp. e00785-23. DOI: 10.1128/aac.00785-23. (Visited on
10/23/2023).

\[29\] C. Higgs, L. S. Kumar, K. Stevens, et al. “Population Structure,
Serotype Distribution and Antibiotic Resistance of Streptococcus
Pneumoniae Causing Invasive Disease in Victoria, Australia”. In:
*Microbial Genomics* 9.7 (2023), p. 001070. ISSN: 2057-5858. DOI:
10.1099/mgen.0.001070. (Visited on 07/25/2023).

\[30\] R. Hill, M. Grey, M. O. Fedi, et al. *Evolutionary Genomics
Reveals Variation in Structure and Genetic Content Implicated in
Virulence and Lifestyle in the Genus Gaeumannomyces*. Feb. 2024. DOI:
10.1101/2024.02.15.580261. (Visited on 02/20/2024).

\[31\] A. T. Hinsu, K. J. Panchal, R. J. Pandit, et al. “Characterizing
Rhizosphere Microbiota of Peanut (Arachis Hypogaea L.) from Pre-Sowing
to Post-Harvest of Crop under Field Conditions”. In: *Sci Rep* 11.1
(Aug. 2021), p. 17457. ISSN: 2045-2322. DOI: 10.1038/s41598-021-97071-3.
(Visited on 09/06/2021).

\[32\] T. Hinzke, F. Tanneberger, C. Aggenbach, et al. “Response
Patterns of Fen Sedges to a Nutrient Gradient Indicate Both Geographic
Origin-Specific Genotypic Differences and Phenotypic Plasticity”. In:
*Wetlands* 42.8 (Nov. 2022), p. 113. ISSN: 1943-6246. DOI:
10.1007/s13157-022-01629-4. (Visited on 11/24/2022).

\[33\] M. Jenckel, I. Smith, T. King, et al. “Distribution and Genetic
Diversity of Hepatitis E Virus in Wild and Domestic Rabbits in
Australia”. In: *Pathogens* 10.12 (Dec. 2021), p. 1637. DOI:
10.3390/pathogens10121637. (Visited on 12/21/2021).

\[34\] H. Jentsch and J. Weidinger. “Spatio-Temporal Analysis of Valley
Wind Systems in the Complex Mountain Topography of the Rolwaling Himal,
Nepal”. In: *Atmosphere* 13.7 (Jul. 2022), p. 1138. ISSN: 2073-4433.
DOI: 10.3390/atmos13071138. (Visited on 08/01/2022).

\[35\] B. Jiang, D. M. Weinstock, K. A. Donovan, et al. “ITK Degradation
to Block T Cell Receptor Signaling and Overcome Therapeutic Resistance
in T Cell Lymphomas”. In: *Cell Chemical Biology* 0.0 (Apr. 2023). ISSN:
2451-9456, 2451-9448. DOI: 10.1016/j.chembiol.2023.03.007. (Visited on
04/07/2023).

\[36\] X. Jin, F. B. Yu, J. Yan, et al. “Culturing of a Complex Gut
Microbial Community in Mucin-Hydrogel Carriers Reveals Strain- and
Gene-Associated Spatial Organization”. In: *Nat Commun* 14.1 (Jun.
2023), p. 3510. ISSN: 2041-1723. DOI: 10.1038/s41467-023-39121-0.
(Visited on 06/17/2023).

\[37\] P. M. Joubert. “Catching up to Fungal Plant Pathogens: A
Characterization of Extrachromosomal Circular DNAs and Gene Presence
Absence Variation in Magnaporthe Oryzae”. PhD thesis. UC Berkeley, 2023.
(Visited on 09/28/2023).

\[38\] P. M. Joubert and K. V. Krasileva. *Distinct Genomic Contexts
Predict Gene Presence-Absence Variation in Different Pathotypes of a
Fungal Plant Pathogen*. Feb. 2023. DOI: 10.1101/2023.02.17.529015.
(Visited on 02/20/2023).

\[39\] M. Jung, D. Wells, J. Rusch, et al. “Unified Single-Cell Analysis
of Testis Gene Regulation and Pathology in Five Mouse Strains”. In:
*eLife* 8 (Jun. 2019). Ed. by D. Bourc’his, P. J. Wittkopp and S.
Lukassen, p. e43966. ISSN: 2050-084X. DOI: 10.7554/eLife.43966. (Visited
on 03/03/2021).

\[40\] T. Karasaki, D. A. Moore, S. Veeriah, et al. “Evolutionary
Characterization of Lung Adenocarcinoma Morphology in TRACERx”. In: *Nat
Med* (Apr. 2023), pp. 1-13. ISSN: 1546-170X. DOI:
10.1038/s41591-023-02230-w. (Visited on 04/14/2023).

\[41\] N. Khan, H. T. T. Nguyen, S. Galelli, et al. “Increasing Drought
Risks Over the Past Four Centuries Amidst Projected Flood
Intensification in the Kabul River Basin (Afghanistan and
Pakistan)-Evidence From Tree Rings”. In: *Geophysical Research Letters*
49.24 (2022), p. e2022GL100703. ISSN: 1944-8007. DOI:
10.1029/2022GL100703. (Visited on 05/09/2023).

\[42\] M. Kornienko, D. Bespiatykh, M. Malakhova, et al. “PCR Assay for
Rapid Taxonomic Differentiation of Virulent Staphylococcus Aureus and
Klebsiella Pneumoniae Bacteriophages”. In: *International Journal of
Molecular Sciences* 24.5 (Jan. 2023), p. 4483. ISSN: 1422-0067. DOI:
10.3390/ijms24054483. (Visited on 03/02/2023).

\[43\] S. Kudrenko, J. Vollering, A. Zedrosser, et al. “Walking on the
Dark Side: Anthropogenic Factors Limit Suitable Habitat for Gray Wolf
(Canis Lupus) in a Large Natural Area Covering Belarus and Ukraine”. In:
*Global Ecology and Conservation* (Jul. 2023), p. e02586. ISSN:
2351-9894. DOI: 10.1016/j.gecco.2023.e02586. (Visited on 07/27/2023).

\[44\] A. Lan, K. Kang, S. Tang, et al. “Fine-Scale Population Structure
and Demographic History of Han Chinese Inferred from Haplotype Network
of 111,000 Genomes”. In: *bioRxiv* (Jul. 2020), p. 2020.07.03.166413.
DOI: 10.1101/2020.07.03.166413. (Visited on 03/03/2021).

\[45\] Z. Lapp, R. Crawford, A. Miles-Jay, et al. “Regional Spread of
blaNDM-1-containing Klebsiella Pneumoniae ST147 in Post-Acute Care
Facilities”. In: *Clinical Infectious Diseases* (May. 2021). ISSN:
1058-4838. DOI: 10.1093/cid/ciab457. (Visited on 05/21/2021).

\[46\] L. S. H. Lee and C. Y. Jim. “Thermal and Humidification Effects
of a Swimming Pool in Hong Kong’s Humid-Subtropical Summer”. In:
*Sustainable Cities and Society* (Jul. 2023), p. 104816. ISSN:
2210-6707. DOI: 10.1016/j.scs.2023.104816. (Visited on 07/25/2023).

\[47\] Z. Liang, T. Liu, Q. Li, et al. “Deciphering the Functional
Landscape of Phosphosites with Deep Neural Network”. In: *Cell Reports*
42.9 (Sep. 2023). ISSN: 2211-1247. DOI: 10.1016/j.celrep.2023.113048.
(Visited on 09/19/2023).

\[48\] X. Lin, Z. Sha, J. Trimpert, et al. “The NSP4 T492I Mutation
Increases SARS-CoV-2 Infectivity by Altering Non-Structural Protein
Cleavage”. In: *Cell Host & Microbe* (Jul. 2023). ISSN: 1931-3128. DOI:
10.1016/j.chom.2023.06.002. (Visited on 07/06/2023).

\[49\] J. Ma, X. Zhu, R. Hu, et al. “A Systematic Review, Meta-Analysis
and Meta-Regression of the Global Prevalence of Foodborne Vibrio Spp.
Infection in Fishes: A Persistent Public Health Concern”. In: *Marine
Pollution Bulletin* 187 (Feb. 2023), p. 114521. ISSN: 0025-326X. DOI:
10.1016/j.marpolbul.2022.114521. (Visited on 01/10/2023).

\[50\] X. Ma, H. Ren, R. Peng, et al. “Identification of Key Genes
Associated with Progression and Prognosis for Lung Squamous Cell
Carcinoma”. In: *PeerJ* 8 (May. 2020), p. e9086. ISSN: 2167-8359. DOI:
10.7717/peerj.9086. (Visited on 02/12/2024).

\[51\] D. G. Maghini, M. Dvorak, A. Dahlen, et al. “Quantifying Bias
Introduced by Sample Collection in Relative and Absolute Microbiome
Measurements”. In: *Nat Biotechnol* (Apr. 2023), pp. 1-11. ISSN:
1546-1696. DOI: 10.1038/s41587-023-01754-3. (Visited on 05/02/2023).

\[52\] S. Mehic. “Genomic and Physiologic Characterization of a
Freshwater Photoarsenotroph, Cereibacter Azotoformans Str. ORIO,
Isolated From Sediments Capable of Light-Dark Arsenic Redox Cycling”.
PhD thesis. UC Santa Cruz, 2022. (Visited on 05/09/2023).

\[53\] E. Merino Tejero, D. Lashgari, R. García-Valiente, et al.
“Multiscale Modeling of Germinal Center Recapitulates the Temporal
Transition From Memory B Cells to Plasma Cells Differentiation as
Regulated by Antigen Affinity-Based Tfh Cell Help”. In: *Front Immunol*
11 (Feb. 2021). ISSN: 1664-3224. DOI: 10.3389/fimmu.2020.620716.
(Visited on 03/03/2021).

\[54\] I. Mokrousov, A. Vyazovaya, E. Shitikov, et al. “Insight into
Pathogenomics and Phylogeography of Hypervirulent and Highly-Lethal
Mycobacterium Tuberculosis Strain Cluster”. In: *BMC Infectious
Diseases* 23.1 (Jun. 2023), p. 426. ISSN: 1471-2334. DOI:
10.1186/s12879-023-08413-7. (Visited on 06/28/2023).

\[55\] R. D. Moore. “Fitting Power-Law Relations in Watershed Science
and Analysis, with an Example Using the R Language”. In: *Confluence:
Journal of Watershed Science and Management* 7.1 (Feb. 2024), pp. 14
pp-14 pp. ISSN: 2561-1836. DOI: 10.22230/jwsm.2024v7n1a53. (Visited on
02/20/2024).

\[56\] I. Navickaite, H. Holmes, L. Dondi, et al. “Occurrence and
Characterization of rmtB-harbouring Salmonella and Escherichia Coli
Isolates from a Pig Farm in the UK”. In: *Journal of Antimicrobial
Chemotherapy* (Apr. 2024), p. dkae102. ISSN: 0305-7453. DOI:
10.1093/jac/dkae102. (Visited on 04/19/2024).

\[57\] G. Papacharalampous, H. Tyralis, S. M. Papalexiou, et al.
“Global-Scale Massive Feature Extraction from Monthly Hydroclimatic Time
Series: Statistical Characterizations, Spatial Patterns and Hydrological
Similarity”. In: *Science of The Total Environment* 767 (May. 2021),
p. 144612. ISSN: 0048-9697. DOI: 10.1016/j.scitotenv.2020.144612.
(Visited on 03/03/2021).

\[58\] Y. Peng, Z. Lu, D. Pan, et al. “Viruses in Deep-Sea Cold Seep
Sediments Harbor Diverse Survival Mechanisms and Remain Genetically
Conserved within Species”. In: *ISME J* 17.10 (Oct. 2023), pp.
1774-1784. ISSN: 1751-7370. DOI: 10.1038/s41396-023-01491-0. (Visited on
04/11/2024).

\[59\] C. Plaza, P. García-Palacios, A. A. Berhe, et al. “Ecosystem
Productivity Has a Stronger Influence than Soil Age on Surface Soil
Carbon Storage across Global Biomes”. In: *Commun Earth Environ* 3.1
(Oct. 2022), pp. 1-8. ISSN: 2662-4435. DOI: 10.1038/s43247-022-00567-7.
(Visited on 10/12/2022).

\[60\] P. Pottier, H. Lin, R. R. Y. Oh, et al. “A Comprehensive Database
of Amphibian Heat Tolerance”. In: *Sci Data* 9.1 (Oct. 2022), p. 600.
ISSN: 2052-4463. DOI: 10.1038/s41597-022-01704-9. (Visited on
10/08/2022).

\[61\] J. M. Quilty, A. E. Sikorska-Senoner, and D. Hah. “A Stochastic
Conceptual-Data-Driven Approach for Improved Hydrological Simulations”.
In: *Environmental Modelling & Software* (Jan. 2022), p. 105326. ISSN:
1364-8152. DOI: 10.1016/j.envsoft.2022.105326. (Visited on 01/19/2022).

\[62\] D. L. Rios, P. C. L. da Silva, C. S. S. Moura, et
al. “Comparative Metatranscriptome Analysis of Brazilian Milk and Water
Kefir Beverages”. In: *Int Microbiol* (Sep. 2023). ISSN: 1618-1905. DOI:
10.1007/s10123-023-00431-4. (Visited on 10/03/2023).

\[63\] H. Rodenhizer, F. Belshe, G. Celis, et al. “Abrupt Permafrost
Thaw Accelerates Carbon Dioxide and Methane Release at a Tussock Tundra
Site”. In: *Arctic, Antarctic, and Alpine Research* 54.1 (Dec. 2022),
pp. 443-464. ISSN: 1523-0430. DOI: 10.1080/15230430.2022.2118639.
(Visited on 10/04/2022).

\[64\] A. Rutz, M. Sorokina, J. Galgonek, et al. “Open Natural Products
Research: Curation and Dissemination of Biological Occurrences of
Chemical Structures through Wikidata”. In: *bioRxiv* (Mar. 2021), p.
2021.02.28.433265. DOI: 10.1101/2021.02.28.433265. (Visited on
03/07/2021).

\[65\] A. Saha, A. Bellucci, S. Fratini, et al. “Ecological Factors and
Parity Mode Correlate with Genome Size Variation in Squamate Reptiles”.
In: *BMC Ecology and Evolution* 23.1 (Dec. 2023), p. 69. ISSN:
2730-7182. DOI: 10.1186/s12862-023-02180-4. (Visited on 12/16/2023).

\[66\] M. R. Scharn, M. C. G. Brachmann, M. A. Patchett, et al.
*Vegetation Responses to 26 Years of Warming at Latnjajaure Field
Station, Northern Sweden.*
<https://cdnsciencepub.com/doi/full/10.1139/as-2020-0042>.
Research-Article. Apr. 2021. DOI: 10.1139/AS-2020-0042. (Visited on
04/05/2021).

\[67\] L. Seep, Z. Razaghi-Moghadam, and Z. Nikoloski. “Reaction Lumping
in Metabolic Networks for Application with Thermodynamic Metabolic Flux
Analysis”. In: *Scientific Reports* 11.1 (Apr. 2021), p. 8544. ISSN:
2045-2322. DOI: 10.1038/s41598-021-87643-8. (Visited on 04/23/2021).

\[68\] O. Seppälä. “Spatial and Temporal Drivers of Soil Respiration in
a Tundra Environment”. MA Thesis. FACULTY OF SCIENCE DEPARTMENT OF
GEOSCIENCES AND GEOGRAPHY GEOGRAPHY: UNIVERSITY OF HELSINKI, 2020.

\[69\] L. Shah, C. A. Arnillas, and G. B. Arhonditsis. “Characterizing
Temporal Trends of Meteorological Extremes in Southern and Central
Ontario, Canada”. In: *Weather and Climate Extremes* (Jan. 2022), p.
100411. ISSN: 2212-0947. DOI: 10.1016/j.wace.2022.100411. (Visited on
01/29/2022).

\[70\] S. A. Simon, K. Schmidt, L. Griesdorn, et al. *Dancing the
Nanopore Limbo - Nanopore Metagenomics from Small DNA Quantities for
Bacterial Genome Reconstruction*. Feb. 2023. DOI:
10.1101/2023.02.16.527874. (Visited on 02/20/2023).

\[71\] E. Smertina, L. M. Keller, N. Huang, et al. “First Detection of
Benign Rabbit Caliciviruses in Chile”. In: *Viruses* 16.3 (Mar. 2024),
p. 439. ISSN: 1999-4915. DOI: 10.3390/v16030439. (Visited on
03/20/2024).

\[72\] C. C. Smith, S. Entwistle, C. Willis, et al. “Landscape and
Selection of Vaccine Epitopes in SARS-CoV-2”. In: *bioRxiv* (Jun. 2020).
DOI: 10.1101/2020.06.04.135004. (Visited on 03/03/2021).

\[73\] F. St-Onge, M. Javanray, A. Pichet Binette, et al. “Functional
Connectome Fingerprinting across the Lifespan”. In: *Network
Neuroscience* (May. 2023), pp. 1-55. ISSN: 2472-1751. DOI:
10.1162/netn_a_00320. (Visited on 05/09/2023).

\[74\] S. N. Thiede, E. S. Snitkin, W. Trick, et al. “Genomic
Epidemiology Suggests Community Origins of Healthcare-Associated USA300
MRSA”. In: *The Journal of Infectious Diseases* (Feb. 2022), p. jiac056.
ISSN: 0022-1899. DOI: 10.1093/infdis/jiac056. (Visited on 02/26/2022).

\[75\] A. V. Thorn, F. M. Aarestrup, and P. Munk. “Flankophile: A
Bioinformatic Pipeline for Prokaryotic Genomic Synteny Analysis”. In:
*Microbiol Spectr* (Dec. 2023), p. e0241323. ISSN: 2165-0497. DOI:
10.1128/spectrum.02413-23.

\[76\] A. Torres-Espín, A. Chou, J. R. Huie, et al. “Reproducible
Analysis of Disease Space via Principal Components Using the Novel R
Package syndRomics”. In: *eLife* 10 (Jan. 2021). Ed. by M. Zaidi and M.
Barton, p. e61812. ISSN: 2050-084X. DOI: 10.7554/eLife.61812. (Visited
on 03/03/2021).

\[77\] Y. Uneno, K. Fukuyama, A. Nishimura, et al. “Barriers and
Facilitators to the Implementation of an Electronic Patient-Reported
Outcome System at Cancer Hospitals in Japan”. In: *Cureus* 16.4 (Apr.
2024). ISSN: 2168-8184. DOI: 10.7759/cureus.58611. (Visited on
04/23/2024).

\[78\] C. Wang, X. Zhao, H. Zhang, et al. “Comprehensive Analysis of
Immune-Related Genes Associated with the Microenvironment of Patients
with Unexplained Infertility”. In: *Annals of Translational Medicine*
11.2 (Jan. 2023), pp. 84-84. ISSN: 2305-5847, 2305-5839. DOI:
10.21037/atm-22-5810. (Visited on 02/12/2023).

\[79\] L. Weidenauer and M. Quadroni. “Phosphorylation in the Charged
Linker Modulates Interactions and Secretion of Hsp90$\beta$”. In:
*Cells* 10.7 (Jul. 2021), p. 1701. DOI: 10.3390/cells10071701. (Visited
on 07/08/2021).

\[80\] D. Wendisch, O. Dietrich, T. Mari, et al. “SARS-CoV-2 Infection
Triggers Profibrotic Macrophage Responses and Lung Fibrosis”. In: *Cell*
(Nov. 2021). ISSN: 0092-8674. DOI: 10.1016/j.cell.2021.11.033. (Visited
on 12/11/2021).

\[81\] R. Woyda, A. Oladeinde, and Z. Abdo. “Chicken Production and
Human Clinical Escherichia Coli Isolates Differ in Their Carriage of
Antimicrobial Resistance and Virulence Factors”. In: *Applied and
Environmental Microbiology* 0.0 (Jan. 2023), pp. e01167-22. DOI:
10.1128/aem.01167-22. (Visited on 01/25/2023).

\[82\] R. J. Wright, M. G. I. Langille, and T. R. Walker. “Food or Just
a Free Ride? A Meta-Analysis Reveals the Global Diversity of the
Plastisphere”. In: *The ISME Journal* 15.3 (Mar. 2021), pp. 789-806.
ISSN: 1751-7370. DOI: 10.1038/s41396-020-00814-9. (Visited on
03/03/2021).

\[83\] P. Wu, C. Chang, G. Zhu, et al. “Network Pharmacology Study of
Bioactive Components and Molecular Mechanisms of the Glycoside Fraction
from $<$em$>$Picrorhiza Scrophulariiflora$<$/Em$>$ Against Experimental
Colitis”. In: *DDDT* 17 (May. 2023), pp. 1531-1546. DOI:
10.2147/DDDT.S407339. (Visited on 05/28/2023).

\[84\] T. Wyenberg-Henzler, R. T. Patterson, and J. C. Mallon.
“Ontogenetic Dietary Shifts in North American Hadrosaurids”. In:
*Cretaceous Research* (Feb. 2022), p. 105177. ISSN: 0195-6671. DOI:
10.1016/j.cretres.2022.105177. (Visited on 02/26/2022).

\[85\] L. Xie, H. Liu, Z. You, et al. “Comprehensive Spatiotemporal
Mapping of Single-Cell Lineages in Developing Mouse Brain by
CRISPR-based Barcoding”. In: *Nat Methods* (Jul. 2023), pp. 1-12. ISSN:
1548-7105. DOI: 10.1038/s41592-023-01947-3. (Visited on 07/24/2023).

\[86\] M. Xie, B. Cheng, S. Yu, et al. “Cuproptosis-Related
MiR-21-5p/FDX1 Axis in Clear Cell Renal Cell Carcinoma and Its Potential
Impact on Tumor Microenvironment”. In: *Cells* 12.1 (Dec. 2022), p. 173.
ISSN: 2073-4409. DOI: 10.3390/cells12010173.

\[87\] Y. Xu, M. Price, P. Que, et al. “Ecological Predictors of
Interspecific Variation in Bird Bill and Leg Lengths on a Global Scale”.
In: *Proceedings of the Royal Society B: Biological Sciences* 290.2003
(Jul. 2023), p. 20231387. DOI: 10.1098/rspb.2023.1387. (Visited on
07/30/2023).

\[88\] A. Yan, J. Butcher, D. Mack, et al. “Virome Sequencing of the
Human Intestinal Mucosal-Luminal Interface”. In: *Front Cell Infect
Microbiol* 10 (Oct. 2020). ISSN: 2235-2988. DOI:
10.3389/fcimb.2020.582187. (Visited on 03/03/2021).

\[89\] P. Zannini, F. Frascaroli, J. Nascimbene, et al. “Sacred Natural
Sites and Biodiversity Conservation: A Systematic Review”. In:
*Biodivers Conserv* (Sep. 2021). ISSN: 1572-9710. DOI:
10.1007/s10531-021-02296-3. (Visited on 10/04/2021).

\[90\] H. L. Zhang, K. J. Gontjes, J. H. Han, et al. “Characterization
of Resistance to Newer Antimicrobials among Carbapenem-Resistant
Klebsiella Pneumoniae in the Post-Acute-Care Setting”. In: *Infection
Control & Hospital Epidemiology* (Jul. 2022), pp. 1-4. ISSN: 0899-823X,
1559-6834. DOI: 10.1017/ice.2022.185. (Visited on 08/01/2022).

\[91\] X. Zhang, X. Yu, Z. Yu, et al. “Network Pharmacology and
Bioinformatics to Identify Molecular Mechanisms and Therapeutic Targets
of Ruyi Jinhuang Powder in the Treatment of Monkeypox”. In: *Medicine*
102.17 (Apr. 2023), p. e33576. DOI: 10.1097/MD.0000000000033576.
(Visited on 05/02/2023).

\[92\] P. Zhu, W. Liu, X. Zhang, et al. “Correlated Evolution of Social
Organization and Lifespan in Mammals”. In: *Nat Commun* 14.1 (Jan.
2023), p. 372. ISSN: 2041-1723. DOI: 10.1038/s41467-023-35869-7.
(Visited on 02/04/2023).
</details>

## Usage

The main function is `new_scale()` and its aliases `new_scale_color()`
and `new_scale_fill()`. When added to a plot, every geom added after
them will use a different scale.

As an example, let’s overlay some measurements over a contour map of
topography using the beloved `volcano`.

``` r
library(ggplot2)
library(ggnewscale)
# Equivalent to melt(volcano)
topography <- expand.grid(x = 1:nrow(volcano),
                          y = 1:ncol(volcano))
topography$z <- c(volcano)

# point measurements of something at a few locations
set.seed(42)
measurements <- data.frame(x = runif(30, 1, 80),
                           y = runif(30, 1, 60),
                           thing = rnorm(30))

ggplot(mapping = aes(x, y)) +
  geom_contour(data = topography, aes(z = z, color = stat(level))) +
  # Color scale for topography
  scale_color_viridis_c(option = "D") +
  # geoms below will use another color scale
  new_scale_color() +
  geom_point(data = measurements, size = 3, aes(color = thing)) +
  # Color scale applied to geoms added after new_scale_color()
  scale_color_viridis_c(option = "A")
#> Warning: `stat(level)` was deprecated in ggplot2 3.4.0.
#> ℹ Please use `after_stat(level)` instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
```

![](man/figures/README-unnamed-chunk-3-1.png)<!-- -->

If you want to create new scales for other `aes`, you can call
`new_scale` with the name of the `aes`. For example, use

``` r
new_scale("linetype")
```

to add multiple linetype scales.
