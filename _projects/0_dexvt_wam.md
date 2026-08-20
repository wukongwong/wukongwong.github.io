---
layout: page
title: DexVT-WAM
permalink: /projects/dexvt-wam/
description: A foundation-model pipeline for dexterous manipulation, from egocentric data to sim-and-real evaluation.
img: assets/img/projects/dexvt-wam-cover.jpg
importance: 0
category: work
---

<p class="lead">
  DexVT-WAM is an end-to-end dexterous manipulation project spanning hardware integration,
  egocentric data processing, foundation-model development, and evaluation in simulation and on real robots.
</p>

<video
class="img-fluid rounded z-depth-1"
controls
playsinline
preload="metadata"
poster="{{ '/assets/img/projects/dexvt-wam-cover.jpg' | relative_url }}"
style="width: 100%; aspect-ratio: 11 / 6; object-fit: cover;"

>

  <source src="{{ '/assets/video/dexvt-wam/demo.mp4' | relative_url }}" type="video/mp4">
  Your browser does not support embedded video.
</video>
<div class="caption">
  Real-robot demonstration on the DexVT-WAM dexterous manipulation platform.
</div>

## Project scope

<div class="row">
  <div class="col-md-6 mt-3">
    <h3>01 &middot; Dexterous platform</h3>
    <p>
      Built an integrated manipulation platform covering robot and hand control, perception,
      calibration, safety, and synchronized data collection.
    </p>
  </div>
  <div class="col-md-6 mt-3">
    <h3>02 &middot; Ego-data pipeline</h3>
    <p>
      Developed a repeatable cleaning workflow for episode segmentation, temporal alignment,
      invalid-frame filtering, quality checks, and training-ready metadata.
    </p>
  </div>
  <div class="col-md-6 mt-3">
    <h3>03 &middot; Model development</h3>
    <p>
      Developed task representations, training and evaluation loops, and adaptation interfaces
      for a dexterous manipulation foundation model.
    </p>
  </div>
  <div class="col-md-6 mt-3">
    <h3>04 &middot; Sim and real evaluation</h3>
    <p>
      Established consistent simulation and physical-robot protocols to measure task success,
      generalization, robustness, and the sim-to-real gap.
    </p>
  </div>
</div>

## System workflow

The project connects the full development loop: platform setup and data capture, ego-data cleaning,
model training and iteration, then simulation and real-world evaluation. Results from both evaluation
tracks feed back into data quality controls and the next model iteration.
