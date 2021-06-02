# Solution 4. Kubernetes - Ambassador

Deployment using Ambassador pattern.

------------------------------------------          --------------------------
|             Deployment                 |          |        Deployment       |
|                                        |          |                         |
| ----------------     --------------    |          |     ----------------    |
| |              |     |            |    |          |     |              |    |
| |              |____ | Ambassador | ___| _________|     |   MariaDB    |    |
| |   Humhub     |     |    Ngix    |    |          |     |              |    |
| |              |     |   Proxy    |    |          |     |              |    |
| |              |     |            |    |          |     |              |    |
| ----------------     --------------    |          |     ----------------    |
|                                        |          |                         |
------------------------------------------          --------------------------



- Dockerfile: fon nginx ambassador container
- nginx.conf: configuration for nginx - mariadb
- humhub.yaml: Deployment for humhub&ambassador
- database_deployment.yaml: MariaDB's deployment
- database_service.yaml: service pending to configure..


