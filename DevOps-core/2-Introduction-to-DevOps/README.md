# GitLab CI/CD Practice

## Assignment Overview

This project demonstrates basic GitLab CI/CD pipeline configuration as part of a DevOps learning course.

### Objectives
- Gain hands-on experience with GitLab CI
- Learn to write pipeline configuration files
- Set up and configure build infrastructure with GitLab Runner

## Pipeline Structure

The pipeline consists of three stages:

| Stage | Job | Description |
|-------|-----|-------------|
| `test` | `unit-testing` | Runs automated tests |
| `build` | `build-app` | Builds the application and creates artifacts |
| `post-build-test` | `smoke-test` | Verifies build artifacts exist |

## Key Concepts Covered

- **Stages & Jobs**: Sequential pipeline execution
- **Artifacts**: Passing files between jobs (`build/` directory)
- **GitLab Runner**: Self-hosted runner with Shell executor
- **Artifact expiration**: Automatic cleanup after 1 hour

## Runner Configuration

- **Type**: Shell executor
- **Registration**: Project-specific runner (shared runners disabled)
- **Host**: Ubuntu server

## Files

- `.gitlab-ci.yml` — Pipeline configuration

## Status

✅ Pipeline passing

---

