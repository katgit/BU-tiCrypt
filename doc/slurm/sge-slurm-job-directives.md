# SGE / Slurm Job Submission Directives Reference

Source: [BU TechWeb – Submitting your Batch Job](https://www.bu.edu/tech/support/research/system-usage/running-jobs/submitting-jobs/#job-options)

> **Note on the `tiCrypt support` column:** No published BU or tiCrypt documentation specifying which individual SGE/Slurm directives are allow-listed inside a tiCrypt enclave could be located. This is likely governed by internal enclave policy rather than public docs. Values are marked **To check** below. A companion test-script bundle (`ticrypt_slurm_directive_tests.tar.gz`) is provided to empirically test each directive inside your tiCrypt enclave and get an actual Yes/No/Partial answer — see that bundle's README for instructions, then update this column with the results.

## General Job Directives

| SGE Directive | Slurm Directive | Description | tiCrypt support |
|---|---|---|---|
| `-l h_rt=hh:mm:ss` | `--time=hh:mm:ss` (`-t`) | Hard wall-clock run time limit for the job (SCC default is 12 hrs). | Yes |
| `-P project_name` | `--account=project_name` (`-A`) | Project/account the job is charged to; mandatory for Med Campus projects on SCC. | Yes |
| `-N job_name` | `--job-name=job_name` (`-J`) | Sets the job's name; defaults to the script/command name. | Yes |
| `-o outputfile` | `--output=file` (`-o`) | File to capture the job's stdout. | Yes |
| `-e errfile` | `--error=file` (`-e`) | File to capture the job's stderr. | Yes |
| `-j y` | *(no direct equivalent)* | Merges stdout and stderr into a single file. Slurm writes stdout/stderr separately by default; combine by only specifying `-o` and omitting `-e`. | Yes |
| `-m b\|e\|a\|s\|n` | `--mail-type=BEGIN,END,FAIL,REQUEUE,ALL,NONE` | Controls when the scheduler emails you (job begin/end/abort/suspend/never). | NA |
| `-M user_email` | `--mail-user=email` | Overrides the default email address for job notifications. | NA |
| `-V` | `--export=ALL` | Exports all current environment variables to the job. | Yes |
| `-v env=value` | `--export=env=value` | Sets a specific environment variable for the job's runtime. | Yes |
| `-hold_jid job_list` | `--dependency=afterok:job_id[:job_id...]` | Makes the job wait on completion of other listed jobs (job dependencies). | Yes |
## Resource Request Directives

| SGE Directive | Slurm Directive | Description | tiCrypt support |
|---|---|---|---|
| `-l mem_per_core=#G` | `--mem-per-cpu=#G` | Requests a minimum amount of memory per core/CPU. | No |
| `-pe omp N` | `--cpus-per-task=N` | Requests N cores/slots on a single node for shared-memory (OpenMP/pthread) jobs. | No |
| `-pe mpi_#_tasks_per_node N` | `--nodes=X --ntasks-per-node=#` | Requests multiple nodes/tasks for an MPI job. | No |
| `-t N` | `--array=1-N` | Submits an array job with N tasks. | Yes, but on POC VM, only 1st task finished successfully |
| `-l cpu_arch=ARCH` | `--constraint=ARCH` | Requests a specific CPU microarchitecture (e.g., broadwell, cascadelake). | NA |
| `-l cpu_type=TYPE` | `--constraint=TYPE` | Requests a specific CPU model (e.g., Gold-6132). | NA |
| `-l gpus=G` | `--gpus=G` (or `--gres=gpu:G`) | Requests a node with G GPUs. | NA |
| `-l gpu_type=GPUMODEL` | `--gpus=MODEL:G` (or `--constraint=MODEL`) | Requests a specific GPU model. | NA |
| `-l gpu_c=CAPABILITY` | | Specifies the minimum required GPU compute capability. | NA |
| `-l gpu_memory=#G` | | Requests a GPU with at least the specified amount of memory. | NA |
| `-l avx` | `--constraint=avx` | Requests a node supporting AVX and newer CPU instructions. | NA |
| `-l avx2` | `--constraint=avx2` | Requests a node supporting AVX2 and newer CPU instructions. | NA |
| `-l avx512` | `--constraint=avx512` | Requests a node supporting AVX512 (Skylake-generation) instructions. | NA |

## Notes

- `-j y` has no clean Slurm counterpart — Slurm's stream-merging behavior is controlled by whether `-e`/`--error` is specified at all, not a standalone flag.
- `-l gpu_c` and `-l gpu_memory` are SCC/SGE-specific resource-matching flags tied to the `qgpus` utility; Slurm sites typically encode this via `--constraint` tags on GPU features instead, but there is no exact 1:1 flag, so these are left blank rather than forcing an inexact mapping.
- Slurm's `--mem-per-cpu`, `--cpus-per-task`, and `--nodes`/`--ntasks-per-node` are the conventional equivalents, but exact syntax/behavior can vary by site depending on how that site's Slurm is configured (e.g., some sites prefer `--mem` over `--mem-per-cpu`).

