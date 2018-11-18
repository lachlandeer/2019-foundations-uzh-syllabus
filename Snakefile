# Main Workflow - syllabus
# Contributors: @lachlandeer

import glob, os

# --- Variable Declarations ---- #
runR = "Rscript --no-save --no-restore --verbose"
logAll = "2>&1"

# --- Main Build Rules --- #

rule four_day:
    input:
        runner = "knit_rmd.R",
        rmd    = "pp4rs-syllabus-4day.Rmd"
    output:
        pdf = "syllabus-4day.pdf"
    log:
        "logs/4-day.Rout"
    shell:
        "{runR} {input.runner} {input.rmd} {output.pdf} > {log} {logAll}"

# --- Cleaning Rules --- #

## clean_all      : delete all output and log files for this project
rule clean_all:
    shell:
        "rm -rf *.pdf"

## clean_logs     : delete all log files for this project
rule clean_log:
    shell:
        "rm -rf log/"
