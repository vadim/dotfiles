# vim: set filetype=R:
.First = function() {
	options(prompt='R> ', continue='+\t', device='quartz')
	options(digits=3, length=500, max.print=1e5)
	options(repos=c(CRAN='http://cran.us.r-project.org'))
	options(cores=parallel::detectCores())
	options(width=as.integer(system2("tput", "cols", stdout=T, stderr=T)))

	source(file.path(Sys.getenv('HOME'), 'R', 'mystuff.R'))
}

.Last = function() {
}

# Attach some more packages
local({
    suppressPackageStartupMessages(require(stats))
    suppressPackageStartupMessages(require(data.table))
    suppressPackageStartupMessages(require(magrittr))
    suppressPackageStartupMessages(require(MASS))
    suppressPackageStartupMessages(require(cluster))
    suppressPackageStartupMessages(require(lattice))
    suppressPackageStartupMessages(require(parallel))
    suppressPackageStartupMessages(library(stringr))
})

setHook(packageEvent('grDevices', 'onLoad'),
        function(...) grDevices::quartz.options(width=5, height=5, pointsize=12))
