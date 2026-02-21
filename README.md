# Social Network Analysis with Neo4j

## Project Overview

This project demonstrates how graph databases can be used to analyze social network interactions, identify influential users, and discover popular content.

The system models users, posts, and their relationships using Neo4j.

---

## Graph Model

### Nodes

* User
* Post
* Topic

### Relationships

* POSTED
* LIKED
* FOLLOWS
* HAS_TOPIC

---

## Technologies

* Neo4j AuraDB
* Cypher Query Language
* Arrows.app
* CSV dataset

---

## Example Queries

### Most Popular Posts

```cypher
MATCH (p:Post)<-[l:LIKED]-()

RETURN p.content, COUNT(l) AS likes
ORDER BY likes DESC
```

---

### Most Influential Users

```cypher
MATCH (u:User)<-[f:FOLLOWS]-()

RETURN u.name, COUNT(f) AS followers
ORDER BY followers DESC
```

---

### User Recommendations

```cypher
MATCH (u:User)-[:FOLLOWS]->(friend)-[:FOLLOWS]->(recommended)

WHERE u <> recommended
AND NOT (u)-[:FOLLOWS]->(recommended)

RETURN u.name, recommended.name
```

---

## Key Insights

Graph databases enable:

* Relationship analysis
* Recommendation systems
* Influence detection
* Community exploration

---

## Author

Karin Araujo
