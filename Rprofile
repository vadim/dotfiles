# vim: set filetype=R:
local({
    suppressMessages(require(data.table))
    suppressMessages(require(magrittr))
    suppressMessages(require(MASS))
    suppressMessages(require(cluster))
    suppressMessages(require(lattice))
    suppressMessages(require(parallel))
    suppressMessages(library(stringr))
})


options(prompt    = 'R> ',
        continue  = '+\t',
        device    = 'quartz',
        digits    = 3,
        length    = 500,
        max.print = 1e5)

options(repos             = c(CRAN = "https://cran.rstudio.com/"),
        browserNLdisabled = TRUE,
        deparse.max.lines = 2)

options(cores    = parallel::detectCores())
options(mc.cores = parallel::detectCores())
options(width = as.integer(system2('tput', 'cols', stdout = T, stderr = T)))
# options(width = as.integer(Sys.getenv('COLUMNS')))

if (interactive()) {
    # suppressMessages(require(devtools))

    # options(devtools.name        = 'Vadim Patsalo')
    # options(devtools.desc.author = 'person("Vadim", "Patsalo",
    #         email = "vadim.patsalo@gmail.com",
    #         role = c("aut", "cre"))')
}

source(file.path(Sys.getenv('HOME'), 'R', 'mystuff.R'))

.First = function() {
    set.seed(31415926)
    setDTthreads(0)
}

.Last  = function() { }

setHook(packageEvent('grDevices', 'onLoad'),
        function(...) grDevices::quartz.options(width     = 5,
                                                height    = 5,
                                                pointsize = 12))
