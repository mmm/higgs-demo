# Notes

The data and images are now in a separate project I've created (with
enough quota) just to work through downsizing that demo into a tutorial.

Note that this is going to take some work:

- The first plan of attack that I'm working through now is to take the "scaled
  down" `config/demo-high-mem-minimal.json`, filter the full dataset to match,
  then run and reproduce the notebook showing the higgs "bump."  Then iterate
  on that process reducing workers/data each time until the bump's just
  identifiable.  Then, work up the costs to run that and move forward from
  there. Stop when it's cheap enough for a tutorial or we can't recognize a
  bump

- If we can't recognize a bump in a reasonable time/scale then the second plan
  of attack is to start to work with Ricardo or Lukas to see if we can decimate
  the monte-carlo runs while still keeping luminosity data at its current
  fidelity.  No real clue if that'll work, but I'm hoping we won't have to go
  that far and we can get something tutorial-sized earlier on

- We need to decide if it makes sense to keep the python wrappers or if it
  makes more sense to extract most of it to simply run from cloudshell
