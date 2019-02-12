# Main Workflow - syllabus
# Contributors: @lachlandeer

import glob, os

# --- Variable Declarations ---- #
# --- Variable Declarations --- #
TEACHING_HOME   = "/home/lachlan/teaching/pp4rs/2019"
COURSE_MATERIAL = "2019-foundations-uzh-material"

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

rule copy2students:
    input:
        script = "move_material.sh",
        pdf = rules.all.output.pdf,
        readme = "README.md"
    params:
        teaching_home = TEACHING_HOME,
        course_material = COURSE_MATERIAL,
        material_path = "00-syllabus"
    output:
        pdf = TEACHING_HOME + "/" + COURSE_MATERIAL + "/00-syllabus/foundations-syllabus.pdf",
        readme = TEACHING_HOME + "/" + COURSE_MATERIAL + "/00-syllabus/README.md",
    log:
        "logs/move_material.txt"
    shell:
        "bash move_material.sh {input.pdf} \
            {input.readme} \
            {params.teaching_home} \
            {params.course_material} \
            {params.material_path} > {log}"

# --- Cleaning Rules --- #

## clean      : delete all output and log files for this project
rule clean:
    shell:
        "rm -rf *.pdf"

## clean_logs     : delete all log files for this project
rule clean_log:
    shell:
        "rm -rf log/"
