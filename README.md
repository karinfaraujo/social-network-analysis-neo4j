# Social Network Analysis with Neo4j

## Project Overview

This project demonstrates how to use Neo4j graph database to analyze social network data.

The graph models:

* Users
* Posts
* Social relationships (follow, like, post)

This allows us to identify:

* Popular posts
* Influential users
* User recommendations

---

## Graph Model

### Nodes

User

Post

### Relationships

POSTED

LIKED

FOLLOWS

---

## Dataset

The dataset was created for learning purposes and includes:

* 8 Users
* 6 Posts
* Follow relationships
* Likes
* Posts created by users

Files:

data/users.csv

data/posts.csv

data/relationships.csv

---

## Constraints

```cypher
CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User)
REQUIRE u.userId IS UNIQUE;

CREATE CONSTRAINT post_id IF NOT EXISTS
FOR (p:Post)
REQUIRE p.postId IS UNIQUE;
```

---

## Import Data

### Import Users

```cypher
LOAD CSV WITH HEADERS FROM LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/karinfaraujo/social-network-analysis-neo4j/main/data/users.csv' AS row

CREATE (:User {
userId: toInteger(row.userId),
name: row.name
});
```

---

### Import Posts

```cypher
LOAD CSV WITH HEADERS FROM LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/karinfaraujo/social-network-analysis-neo4j/main/data/posts.csv' AS row

CREATE (:Post {
postId: toInteger(row.postId),
content: row.content
});
```

---

### Import POSTED

```cypher
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/karinfaraujo/social-network-analysis-neo4j/main/data/relationships.csv' AS row

WITH row WHERE row.type = 'POSTED'

MATCH (u:User {userId: toInteger(row.userId)})
MATCH (p:Post {postId: toInteger(row.postId)})

CREATE (u)-[:POSTED]->(p);
```

---

### Import LIKED

```cypher
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/karinfaraujo/social-network-analysis-neo4j/main/data/relationships.csv' AS row

WITH row WHERE row.type = 'LIKED'

MATCH (u:User {userId: toInteger(row.userId)})
MATCH (p:Post {postId: toInteger(row.postId)})

CREATE (u)-[:LIKED]->(p);
```

---

### Import FOLLOWS

```cypher
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/karinfaraujo/social-network-analysis-neo4j/main/data/relationships.csv' AS row

WITH row WHERE row.type = 'FOLLOWS'

MATCH (u1:User {userId: toInteger(row.userId)})
MATCH (u2:User {userId: toInteger(row.postId)})

CREATE (u1)-[:FOLLOWS]->(u2);
```

---

## Queries

---

### Most Popular Posts

```cypher
PROFILE

MATCH (p:Post)<-[l:LIKED]-()

RETURN p.content, COUNT(l) AS likes

ORDER BY likes DESC
```

---

### Most Influential Users

```cypher
PROFILE

MATCH (u:User)<-[f:FOLLOWS]-()

RETURN u.name, COUNT(f) AS followers

ORDER BY followers DESC
```

---

### User Recommendation

```cypher
PROFILE

MATCH (u:User)-[:FOLLOWS]->(friend)-[:FOLLOWS]->(recommended)

WHERE u <> recommended
AND NOT (u)-[:FOLLOWS]->(recommended)

RETURN u.name, recommended.name
```

---

### Show Graph

```cypher
MATCH (n)-[r]->(m)

RETURN n,r,m
```

---

## Performance

To inspect performance:

```cypher
SHOW CONSTRAINTS
```

and

```cypher
PROFILE
```

---

## Tools Used

Neo4j AuraDB

Cypher

Arrows.app

---

## Author

Karin Araujo

Data Analyst
