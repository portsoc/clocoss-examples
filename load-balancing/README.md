# scripts that set up load-balanced VMs

Based on Google's [Cross-region example](https://cloud.google.com/compute/docs/load-balancing/http/cross-region-example)

## Usage:

* The scripts should be used in numerical order.
* Every script can take a prefix so that various users in the same project won't have clashing names. For example,
  ```
  sh 1-createVMs.sh jacek-
  ```
  would create four VMs that are named like `jacek-www-lb-1`.
