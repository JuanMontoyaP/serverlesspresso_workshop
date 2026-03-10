# Serverlesspresso Workshop

This is the complete code for the Serverlesspresso Workshop followed on the AWS Serverless Workshop: https://catalog.workshops.aws/serverlesspresso/en-US

It has all the code for the workshop and its main purpose is to replicate and learn from the code used in the workshop. It is not meant to be used as a template for production applications, but rather as a learning tool for those who want to understand how to build serverless applications on AWS.

---

# Architectural Diagram

This is a microservices-based architecture that uses AWS Lambda, Amazon API Gateway, Amazon DynamoDB, and other AWS services to build a serverless application. The architecture is designed to be scalable, resilient, and cost-effective, allowing developers to focus on building features rather than managing infrastructure.

![Serverlesspresso Workshop Architecture Diagram](https://static.us-east-1.prod.workshops.aws/public/ea486ce8-2a1a-4a47-a234-c57552a09abf/static/se-setup-overview4.jpg)

The service has three frontend applications:

- **Display app:** This is what is normally displayed on a monitor. It provides a QR for customers to scan to place an order, and shows a realtime overview of upcoming and completed drink orders.
- **Ordering app:** This is used by customers to place an order. It is designed to run on mobile devices. When you are testing today, you'll use your mobile device with this app to place orders.
- **Barista app:** This runs on tablets used by the baristas. The app allows baristas to change the status of a drink order, or cancel the order if needed. Updates from this application are propagated to the other apps.
