# SGE / Slurm Job Environment Variables Reference

Companion to [`sge-slurm-job-directives.md`](./sge-slurm-job-directives.md).

Sources:
- [Slurm `sbatch(1)` — OUTPUT ENVIRONMENT VARIABLES](https://slurm.schedmd.com/sbatch.html) (Slurm 26.05)
- [BU TechWeb – Advanced Batch System Usage](https://www.bu.edu/tech/support/research/system-usage/running-jobs/advanced-batch/)
- [BU TechWeb – Submitting your Batch Job](https://www.bu.edu/tech/support/research/system-usage/running-jobs/submitting-jobs/)

> **Scope:** This document covers **job-runtime (output) variables** — those the scheduler *sets* in the environment of a running batch job, which you reference from inside your script. It does not cover *input* variables (e.g. `SBATCH_ACCOUNT`, `SLURM_TIME_FORMAT`) that you set before submission to change `sbatch`/`srun` defaults. The exception is the `SBATCH_MEM_BIND*` family, which Slurm documents under output variables.

> **Note on the `tiCrypt support` column:** As with the directives doc, no published BU or tiCrypt documentation specifying which environment variables are populated inside a tiCrypt enclave could be located. Availability depends on the enclave's Slurm configuration and which plugins are enabled (e.g. `cons_tres` vs `select/linear`, `topology/tree`, GPU/GRES support), so values are marked **To check** below. Most of these can be verified empirically in one shot by submitting a job whose body is `env | grep -E '^(SLURM|SBATCH|SLURMD)' | sort` and inspecting the output.

## Job Identity

| SGE Variable | Slurm Variable | Description | tiCrypt support |
|---|---|---|---|
| `JOB_ID` | `SLURM_JOB_ID` | The ID of the job allocation. | To check |
| `JOB_ID` | `SLURM_JOBID` | Same as `SLURM_JOB_ID`; included for backwards compatibility. | To check |
| `JOB_NAME` | `SLURM_JOB_NAME` | Name of the job. | To check |
| `QUEUE` | `SLURM_JOB_PARTITION` | Name of the partition (SGE: queue) in which the job is running. | To check |
| *(no direct equivalent)* | `SLURM_CLUSTER_NAME` | Name of the cluster on which the job is executing. | To check |
| *(project via `-P`)* | `SLURM_JOB_ACCOUNT` | Account name associated with the job allocation. | To check |
| *(no direct equivalent)* | `SLURM_JOB_QOS` | Quality of Service (QOS) of the job allocation. | To check |
| *(no direct equivalent)* | `SLURM_JOB_RESERVATION` | Advance reservation containing the job allocation, if any. | To check |
| *(no direct equivalent)* | `SLURM_JOB_LICENSES` | Name and count of any license(s) requested. | To check |
| `RESTARTED` | `SLURM_RESTART_COUNT` | SGE sets `RESTARTED=1` if the job was restarted. Slurm reports the *number* of times the job has been restarted due to system failure or explicit requeue. | To check |
| *(no direct equivalent)* | `SLURM_JOB_DEPENDENCY` | Set to the value of the `--dependency` option. | To check |
| *(no direct equivalent)* | `SLURM_JOB_START_TIME` | UNIX timestamp for the job's start time. | To check |
| *(no direct equivalent)* | `SLURM_JOB_END_TIME` | UNIX timestamp for the job's projected end time. | To check |

## Array Jobs

| SGE Variable | Slurm Variable | Description | tiCrypt support |
|---|---|---|---|
| `SGE_TASK_ID` | `SLURM_ARRAY_TASK_ID` | Array task ID (index) of the current task. | To check |
| `JOB_ID` | `SLURM_ARRAY_JOB_ID` | The array's master job ID number. In SGE all tasks share `JOB_ID`; Slurm gives each task its own `SLURM_JOB_ID` and exposes the parent separately. | To check |
| `SGE_TASK_FIRST` | `SLURM_ARRAY_TASK_MIN` | Lowest index in the array. | To check |
| `SGE_TASK_LAST` | `SLURM_ARRAY_TASK_MAX` | Highest index in the array. | To check |
| `SGE_TASK_STEPSIZE` | `SLURM_ARRAY_TASK_STEP` | Index step size of the array specification. | To check |
| *(no direct equivalent)* | `SLURM_ARRAY_TASK_COUNT` | Total number of tasks in the array. | To check |

> See the directives doc: array jobs (`--array`) were observed to run only the first task successfully on the POC VM, so array-related variables deserve particular scrutiny.

## Nodes and Task Topology

| SGE Variable | Slurm Variable | Description | tiCrypt support |
|---|---|---|---|
| `HOSTNAME` | `SLURMD_NODENAME` | Name of the node running the job script. | To check |
| `NHOSTS` | `SLURM_JOB_NUM_NODES` | Total number of nodes in the job's resource allocation. | To check |
| `NHOSTS` | `SLURM_NNODES` | Same as `SLURM_JOB_NUM_NODES`; included for backwards compatibility. | To check |
| `PE_HOSTFILE` | `SLURM_JOB_NODELIST` | SGE writes a hostfile listing allocated hosts and slot counts; Slurm exposes the node list directly (expand with `scontrol show hostnames`). | To check |
| `PE_HOSTFILE` | `SLURM_NODELIST` | Same as `SLURM_JOB_NODELIST`; included for backwards compatibility. | To check |
| *(no direct equivalent)* | `SLURM_NODEID` | Relative ID of the node within the allocation. | To check |
| `NSLOTS` | `SLURM_NTASKS` | Number of tasks. Set from `--ntasks`, or derived if any `--ntasks-per-*` option was used. **Note:** also an *input* variable for `srun`, so leaving it set affects `srun` calls made from the batch script. | To check |
| `NSLOTS` | `SLURM_NPROCS` | Same as `SLURM_NTASKS`; included for backwards compatibility. | To check |
| *(no direct equivalent)* | `SLURM_TASKS_PER_NODE` | Tasks to be initiated on each node, comma separated, in the same order as `SLURM_JOB_NODELIST`. Repeats are compressed as `count(x#)` — e.g. `2(x3),1`. | To check |
| *(no direct equivalent)* | `SLURM_NTASKS_PER_NODE` | Tasks requested per node. Only set if `--ntasks-per-node` was specified. | To check |
| *(no direct equivalent)* | `SLURM_NTASKS_PER_CORE` | Tasks requested per core. Only set if `--ntasks-per-core` was specified. | To check |
| *(no direct equivalent)* | `SLURM_NTASKS_PER_SOCKET` | Tasks requested per socket. Only set if `--ntasks-per-socket` was specified. | To check |
| *(no direct equivalent)* | `SLURM_NTASKS_PER_GPU` | Tasks requested per GPU. Only set if `--ntasks-per-gpu` was specified. | To check |
| *(no direct equivalent)* | `SLURM_PROCID` | MPI rank (relative process ID) of the current process. | To check |
| *(no direct equivalent)* | `SLURM_LOCALID` | Node-local task ID for the process within the job. | To check |
| *(no direct equivalent)* | `SLURM_GTIDS` | Global task IDs running on this node — zero-origin, comma separated. Read internally by PMI. Leaving it set is known to break some third-party packages (Abaqus, Ansys). | To check |
| *(no direct equivalent)* | `SLURM_TASK_PID` | Process ID of the task being started. | To check |
| *(no direct equivalent)* | `SLURM_JOB_SEGMENT_SIZE` | Segment size used to create the allocation. Only set if `--segment` was specified. | To check |
| *(no direct equivalent)* | `SLURM_TOPOLOGY_ADDR` | Requires the `topology/tree` plugin. Period-separated path of network switches involved in the job's communications, from top-level switch down to leaf switch, ending with the node name. | To check |
| *(no direct equivalent)* | `SLURM_TOPOLOGY_ADDR_PATTERN` | Requires the `topology/tree` plugin. Period-separated component types matching `SLURM_TOPOLOGY_ADDR`, each either `switch` or `node`. | To check |

## CPU and Memory Resources

| SGE Variable | Slurm Variable | Description | tiCrypt support |
|---|---|---|---|
| `NSLOTS` | `SLURM_CPUS_ON_NODE` | CPUs allocated to the batch step. Under `select/linear` whole nodes are allocated, so this is the node's total CPU count; under `cons_tres` it is the CPUs on this node allocated to the step. | To check |
| `NSLOTS` (`-pe omp N`) | `SLURM_CPUS_PER_TASK` | CPUs requested per task. Only set if `--cpus-per-task` or `--tres-per-task=cpu=#` was specified. | To check |
| *(no direct equivalent)* | `SLURM_JOB_CPUS_PER_NODE` | CPUs available to the job per node, formatted `CPU_count[(xnodes)][,...]` — e.g. `72(x2),36`. Interpretation depends on the select plugin, as above. | To check |
| `-l mem_per_core` | `SLURM_MEM_PER_CPU` | Same as `--mem-per-cpu`. Per the directives doc, `--mem-per-cpu` is **not** supported in tiCrypt, so this is unlikely to be set. | To check |
| *(no direct equivalent)* | `SLURM_MEM_PER_NODE` | Same as `--mem`. | To check |
| *(no direct equivalent)* | `SLURM_THREADS_PER_CORE` | Only set if `--threads-per-core` or `SBATCH_THREADS_PER_CORE` was specified; used by subsequent `srun` calls in the allocation. | To check |
| *(no direct equivalent)* | `SLURM_OVERCOMMIT` | Set to `1` if `--overcommit` was specified. | To check |
| *(no direct equivalent)* | `SLURM_DISTRIBUTION` | Same as `-m`, `--distribution`. | To check |
| *(no direct equivalent)* | `SLURM_DIST_PLANESIZE` | Plane distribution size. Only set for plane distributions. | To check |
| *(no direct equivalent)* | `SLURM_TRES_PER_TASK` | Value of `--tres-per-task`. Also populated when `--cpus-per-task` or `--gpus-per-task` is given, as if specified via `--tres-per-task`. | To check |
| *(no direct equivalent)* | `SLURM_PRIO_PROCESS` | Scheduling priority (nice value) at submission time; propagated to spawned processes. | To check |
| *(no direct equivalent)* | `SLURM_OOMKILLSTEP` | Same as `--oom-kill-step`. | To check |
| *(no direct equivalent)* | `SLURM_PROFILE` | Same as `--profile`. | To check |
| *(no direct equivalent)* | `SLURM_NETWORK` | Value of the `--network` option, if specified. | To check |

### Memory binding

Slurm documents these under output variables even though they mirror submission options. SGE has no equivalent family.

| Slurm Variable | Description | tiCrypt support |
|---|---|---|
| `SBATCH_MEM_BIND` | Value of the `--mem-bind` option. | To check |
| `SBATCH_MEM_BIND_TYPE` | Binding type from `--mem-bind`: `none`, `rank`, `map_mem:`, `mask_mem:`, or `local`. | To check |
| `SBATCH_MEM_BIND_LIST` | Bit mask used for memory binding. | To check |
| `SBATCH_MEM_BIND_PREFER` | Set to `prefer` if `--mem-bind` included the `prefer` option. | To check |
| `SBATCH_MEM_BIND_VERBOSE` | Set to `verbose` if `--mem-bind` included `verbose`; `quiet` otherwise. | To check |

## GPU Resources

Per the directives doc, GPU directives are **NA** in the current tiCrypt setup, so these are expected to be unset.

| SGE Variable | Slurm Variable | Description | tiCrypt support |
|---|---|---|---|
| *(no direct equivalent)* | `SLURM_GPUS` | Number of GPUs requested. Only set if `-G`, `--gpus` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_GPUS_ON_NODE` | GPUs allocated to the batch step. | NA (expected) |
| *(no direct equivalent)* | `SLURM_JOB_GPUS` | Global GPU IDs allocated to the job — not relative to any device cgroup, even under `task/cgroup`. Only set in batch and interactive jobs. | NA (expected) |
| *(no direct equivalent)* | `SLURM_GPUS_PER_NODE` | GPU count per allocated node. Only set if `--gpus-per-node` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_GPUS_PER_SOCKET` | GPU count per allocated socket. Only set if `--gpus-per-socket` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_CPUS_PER_GPU` | CPUs requested per allocated GPU. Only set if `--cpus-per-gpu` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_MEM_PER_GPU` | Memory per allocated GPU. Only set if `--mem-per-gpu` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_GPU_BIND` | Requested binding of tasks to GPUs. Only set if `--gpu-bind` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_GPU_FREQ` | Requested GPU frequency. Only set if `--gpu-freq` was specified. | NA (expected) |
| *(no direct equivalent)* | `SLURM_SHARDS_ON_NODE` | Number of GPU shards available to the step on this node. | NA (expected) |

## Submission Context and Environment

| SGE Variable | Slurm Variable | Description | tiCrypt support |
|---|---|---|---|
| `SGE_O_WORKDIR` | `SLURM_SUBMIT_DIR` | Directory from which the job was submitted. **Behavioral difference:** SGE starts the job in your home directory unless `-cwd` is given, while Slurm starts it in the submission directory by default. | To check |
| `SGE_O_HOST` | `SLURM_SUBMIT_HOST` | Hostname of the machine from which the job was submitted. | To check |
| *(no direct equivalent)* | `SLURM_EXPORT_ENV` | Same as `--export`. | To check |
| `SGE_CWD_PATH` | *(no direct equivalent)* | SGE: working directory of the job. Use `SLURM_SUBMIT_DIR` or `pwd`. | NA |
| `SGE_STDOUT_PATH` | *(no direct equivalent)* | SGE: path of the job's stdout file. Slurm does not export this; reconstruct from your `--output` pattern. | NA |
| `SGE_STDERR_PATH` | *(no direct equivalent)* | SGE: path of the job's stderr file. Slurm does not export this; reconstruct from your `--error` pattern. | NA |
| `SGE_JOB_SPOOL_DIR` | *(no direct equivalent)* | SGE: scheduler's spool directory for the job. No Slurm counterpart. | NA |
| `TMPDIR` | `TMPDIR` | Node-local scratch directory. Not a Slurm variable — set by site configuration (often via a prolog or `job_container/tmpfs`), so presence and cleanup behavior are entirely site-dependent. | To check |
| `ENVIRONMENT` | *(no direct equivalent)* | SGE sets `ENVIRONMENT=BATCH` for batch jobs. To detect batch context under Slurm, test for `SLURM_JOB_ID`. | NA |

## Containers

| Slurm Variable | Description | tiCrypt support |
|---|---|---|
| `SLURM_CONTAINER` | OCI bundle for the job. Only set if `--container` was specified. | To check |
| `SLURM_CONTAINER_ID` | OCI ID for the job. Only set if `--container-id` was specified. | To check |
| `SLURM_CONTAINER_TYPE` | Container type for the job. Only set if `--container-type` was specified. | To check |

## Heterogeneous Jobs

SGE has no equivalent concept.

| Slurm Variable | Description | tiCrypt support |
|---|---|---|
| `SLURM_HET_SIZE` | Count of components in a heterogeneous job. | To check |
| `SLURM_*_HET_GROUP_#` | For heterogeneous allocations, the standard variables are also set per component, suffixed with the component's group number. | To check |

## Notes

- **Backwards-compatibility aliases.** `SLURM_JOBID`, `SLURM_NNODES`, `SLURM_NODELIST`, and `SLURM_NPROCS` duplicate `SLURM_JOB_ID`, `SLURM_JOB_NUM_NODES`, `SLURM_JOB_NODELIST`, and `SLURM_NTASKS` respectively. The Slurm man page describes them as "Included for backwards compatibility" rather than deprecated, but new scripts should prefer the modern names.
- **`NSLOTS` has no single Slurm equivalent.** SGE collapses "cores" and "slots" into one number; Slurm splits the concept across `SLURM_NTASKS` (task count), `SLURM_CPUS_PER_TASK` (cores per task), and `SLURM_CPUS_ON_NODE` (cores on this node). Porting a script that uses `$NSLOTS` for thread count usually means `$SLURM_CPUS_PER_TASK`, with a fallback since it is only set when the corresponding option was given:
  ```bash
  export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK:-1}
  ```
- **`SLURM_NTASKS` is dual-purpose.** It is an output variable in the batch script *and* an input variable for `srun`, so an exported value will implicitly set `--ntasks` for `srun` calls within the job.
- **Plugin dependence.** `SLURM_CPUS_ON_NODE` and `SLURM_JOB_CPUS_PER_NODE` mean different things under `select/linear` (whole nodes) versus `select/cons_tres` (individual CPUs). Confirm which plugin the tiCrypt enclave uses before relying on either.
- **`PE_HOSTFILE` vs `SLURM_JOB_NODELIST`.** SGE hands you a file path; Slurm hands you a compressed range expression (e.g. `node[01-04]`). Expand it with `scontrol show hostnames "$SLURM_JOB_NODELIST"`.
- **Variables marked "Only set if ..."** are absent rather than empty when the corresponding option was not used. Always use a default (`${VAR:-fallback}`) when reading them.
- **No `-m`/`-M` equivalents.** Email notification directives are NA in tiCrypt per the directives doc, and Slurm exports no output variables for them in any case.
