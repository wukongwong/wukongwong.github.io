---
layout: about
title: about
permalink: /
nav: false
subtitle: <a href='https://www.mi.com/'>Xiaomi Robotics</a> · Senior Algorithm Engineer · Dexterous Manipulation Technical Lead

profile:
  align: right
  image: myphoto.jpg
  image_circular: false # crops the image to make it circular
  more_info: >
    <p>Beijing, China</p>
    <p>📧 wukongwoong@gmail.com</p>

selected_papers: true # includes a list of papers marked as "selected={true}"
social: true # includes social icons at the bottom of the page

announcements:
  enabled: true # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 8 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

## "Noting new in human intelligence compared to AI."

Hello, I am Shuaijun Wang, currently serving as Technical Lead of Dexterous Manipulation in the Robotics Department at Xiaomi Technology. I received my Ph.D. degree from the Robotics Institute, National Key Laboratory of Harbin Institute of Technology, under the supervision of Professor Lining Sun. I obtained my M.S. degree from Harbin Institute of Technology(Shenzhen) under the supervision of Professor Xin Wang, and my B.S. degree from Northeast Forestry University as an Outstanding Graduate.

Between 2019 and 2021, I conducted research as a visiting scholar at the School of Informatics, Robotics Center of the University of Edinburgh, working with Professor Zhibin(Alex) Li. From March 2022 to December 2022, I collaborated remotely with Professor Qiang Li at the Robotics Center of the University of Bielefeld in Germany. In 2022-2023, I worked as a research intern at Tencent Robotics X Laboratory.

My research focuses on universal and dexterous grasping and manipulation of humanoid robots, as well as embodied AI. 

### Research Interests
- Dexterous Manipulation and Grasping
- Tactile Perception and Feedback
- Reinforcement Learning and Imitation Learning
- Full-self Manipulation(FSM)
- Embodied Intelligence

### Handover-in-Air

Handover-in-Air is a dexterous manipulation project for aerial object handover. It studies how a robot can perceive, approach, grasp, and transfer objects while the target is in motion, combining robust motion planning with reactive manipulation policies for fast handover scenarios.

<div class="row align-items-start">
  <div class="col-md-7 mt-3">
    {% include video.liquid path="assets/video/handover-in-air/handover.mp4" class="img-fluid rounded z-depth-1" controls=true muted=true loop=true poster="assets/img/projects/handover-in-air.jpg" %}
  </div>
  <div class="col-md-5 mt-3">
    {% include video.liquid path="assets/video/handover-in-air/in-air-demo.mp4" class="img-fluid rounded z-depth-1" controls=true muted=true loop=true %}
  </div>
</div>

The project focuses on reliable in-air transfer under short interaction windows, where the robot must coordinate timing, hand pose, and grasp stability as the object moves through the workspace.
