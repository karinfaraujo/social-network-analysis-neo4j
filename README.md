# Social Network Analysis using Neo4j

## Overview

This project demonstrates how to analyze social network data using a graph database.

Graph databases allow efficient analysis of relationships between users, posts, and topics.

This prototype simulates a social media platform.

---

## Technologies

Neo4j AuraDB

Cypher Query Language

Graph Data Modeling

Arrows.app

---

## Graph Model

Nodes:

User

Post

Topic

Relationships:

FOLLOWS

POSTED

LIKED

HAS_TOPIC

---

## Example Queries

### Most Popular Users

```cypher
MATCH (u:User)<-[:FOLLOWS]-(f)

RETURN

u.name,
COUNT(f) AS followers

ORDER BY followers DESC
```

---

### Most Popular Posts

```cypher
MATCH (p:Post)<-[:LIKED]-(u)

RETURN

p.content,
COUNT(u) AS likes

ORDER BY likes DESC
```

---

### Common Interests

```cypher
MATCH (u1:User)-[:LIKED]->(p:Post)<-[:LIKED]-(u2:User)

WHERE u1 <> u2

RETURN

u1.name,
u2.name,
COUNT(p)
```

---

## Skills Demonstrated

Graph Database Modeling

Cypher Queries

Social Network Analysis

Constraints and Query Optimization

---

## Author

Karin Araujo

Data Analytics Portfolio Project

Brazil
