---
permalink: /
title: "Diego Martinez-Baselga"
excerpt: "Researcher and professor working on Research topic one, Research topic two, and Research topic three."
author_profile: true
redirect_from:
  - /about/
---

## Postdoctoral researcher, TU Delft

I received the PhD. Degree in Computer Science and Systems Engineering from the Universidad de Zaragoza in 2026, supervised by Prof. Luis Riazuelo and Prof. Luis Montano. I visited Prof. Javier Alonso-Mora at  TU Delft in 2023, and Prof. Jana Tumova at KTH in 2025. Now, I am a postdoctoral researcher at the Autonomous Multi-Robots Lab, TU Delft. My research interests are robotic navigation, robot learning, and multi-robot systems. I currently serve as associate editor in IEEE Robotics and Automation Letters.

## Research topics

<div class="research-themes">
{% for theme in site.data.research.themes %}
  <section class="research-theme">
    <h3>{{ theme.title }}</h3>
    <p>{{ theme.description }}</p>
  </section>
{% endfor %}
</div>

## Connect

- [Google Scholar]({{ site.author.googlescholar }})
- [ORCID]({{ site.author.orcid }})
- [GitHub](https://github.com/{{ site.author.github }})
- [Email](mailto:{{ site.author.email }})
