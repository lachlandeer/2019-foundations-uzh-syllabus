# Main Workflow - syllabus
# Contributors: @lachlandeer

import glob, os

# --- Variable Declarations ---- #
runR = "Rscript --no-save --no-restore --verbose"
logAll = "2>&1"

# --- Main Build Rules --- #


rule all:
    input:
        runner = "knit_rmd.R",
        rmd    = "pp4rs-foundations.Rmd",
        template = "svm-latex-syllabus.tex"
    output:
        pdf = "foundations-syllabus.pdf"
    log:
        "logs/foundations-syllabus.Rout"
    shell:
        "{runR} {input.runner} {input.rmd} {output.pdf} > {log} {logAll}"


# --- Cleaning Rules --- #

## clean      : delete all output and log files for this project
rule clean:
    shell:
        "rm -rf *.pdf"

## clean_logs     : delete all log files for this project
rule clean_log:
    shell:
        "rm -rf log/"
