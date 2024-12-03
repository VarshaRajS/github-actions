# Automating AWS Infrastructure with Terraform & GitHub Actions

This project demonstrates how to automate the deployment of a static website to an AWS S3 bucket using Terraform and GitHub Actions. It provides a complete Infrastructure as Code (IaC) pipeline for a streamlined CI/CD workflow.

![image](https://github.com/user-attachments/assets/e0564850-9a00-4caa-97e5-2c50dc471974)

## Key Features:
1. Terraform for Infrastructure Management: Defines and manages AWS resources, including an S3 bucket configured for static website hosting.
2. Secure Credential Management: Utilizes an IAM user with GitHub repository secrets for secure storage of AWS credentials used by Terraform and GitHub Actions.
3. Remote Backend with State Locking: Employs a remote backend in S3 for storing Terraform state with a DynamoDB table for collaboration and state locking.
4. Automated CI/CD with GitHub Actions: Runs Terraform commands on every push to the main branch, automating infrastructure deployment.
5. Public Access for Static Website: Configures AWS provider and bucket policies to enable public access for the deployed website.

## Breakdown:
1. Terraform S3 Setup: Creates an S3 bucket with static website hosting and configures bucket policies for public access.
2. GitHub Actions Workflow: Automates Terraform initialization, planning, and application using GitHub Actions.
3. Remote Backend: Sets up a secure S3 bucket with a DynamoDB table for storing Terraform state and ensuring state locking.
4. CI/CD Pipeline: Automatically deploys the website to the S3 bucket on every code push, ensuring seamless infrastructure updates.

## Why Choose GitHub Actions?
This project highlights the benefits of using GitHub Actions over Jenkins, particularly for:

1. GitHub-Centric Workflows: Seamless integration with GitHub repositories, triggering workflows based on events like pushes or pull requests.
2. Simplicity and Maintenance: Minimal setup and maintenance compared to Jenkins, reducing operational overhead for smaller projects and teams.
3. Managed Workflows: Fully managed service that handles scaling and infrastructure management, eliminating the need for setting up and maintaining a dedicated CI/CD server.

## Benefits of This Project:
1. Provides hands-on experience with automating cloud infrastructure deployment.
2. Demonstrates the integration of CI/CD pipelines for a streamlined development experience.

   
