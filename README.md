# Neersense

NeerSense is an IoT-based smart water monitoring system built to make water usage transparent, efficient, and safe. It integrates a network of advanced sensors, cloud-based analytics, and AI-powered decision systems to deliver real-time insights into how water is consumed and how its quality changes over time.
The system continuously tracks key parameters such as pH, turbidity, TDS, and flow rate, enabling early detection of leaks, contamination risks, and abnormal usage patterns. These raw measurements are processed through cloud analytics and surfaced through a user-friendly mobile application that converts sensor data into clear, actionable insights.

NeerSense doesn’t just visualize data — it guides users with alerts, consumption trends, and recommendations that promote better water usage habits. This helps households reduce wastage, prevent plumbing failures, and maintain safe water quality without requiring technical expertise.

The architecture is designed for scalability. While the prototype focuses on home-level monitoring, the underlying system can extend to industrial water pipelines, agricultural irrigation networks, apartment complexes, and municipal water distribution. By combining IoT hardware, real-time databases, and AI-driven analytics, NeerSense supports responsible and sustainable water management at any scale.

Overall, NeerSense provides a unified solution that connects sensors, cloud infrastructure, and an intuitive mobile interface to empower users with meaningful insights, improve efficiency, and contribute to long-term water conservation efforts.

## Prototype  

<video src="https://github.com/user-attachments/assets/1e79f8df-6083-4353-9bd9-c49c3925302a" controls></video>

**What this shows:** <br>
A walkthrough of the NeerSense mobile app UI. It highlights the core user-facing features—real-time sensor values, water-quality indicators, alerts, and usage insights.

## Working Demo
<video src="https://github.com/user-attachments/assets/738697c7-4772-489b-9c71-47dca1bbec2c" controls></video>

**What this demonstrates:** <br>
A live end-to-end view of the NeerSense system in action.
- **Top-right:** Arduino IDE managing the ESP32 and sensor integrations.
- **Left:** Firebase Realtime Database updating live sensor values (pH, turbidity, TDS, flow).
- **Right:** The mobile app emulator receiving and visualizing real-time data for the end user.
