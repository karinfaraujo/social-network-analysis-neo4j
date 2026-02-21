// ========================================
// CONSTRAINTS
// ========================================

CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User) REQUIRE u.userId IS UNIQUE;

CREATE CONSTRAINT post_id IF NOT EXISTS
FOR (p:Post) REQUIRE p.postId IS UNIQUE;

CREATE CONSTRAINT topic_name IF NOT EXISTS
FOR (t:Topic) REQUIRE t.name IS UNIQUE;



// ========================================
// USERS
// ========================================

CREATE
(u1:User {userId: 1, name: "Ana"}),
(u2:User {userId: 2, name: "Bruno"}),
(u3:User {userId: 3, name: "Carlos"}),
(u4:User {userId: 4, name: "Diana"}),
(u5:User {userId: 5, name: "Eduardo"}),
(u6:User {userId: 6, name: "Fernanda"});



// ========================================
// FOLLOWS RELATIONSHIPS
// ========================================

CREATE

(u1)-[:FOLLOWS]->(u2),
(u1)-[:FOLLOWS]->(u3),
(u2)-[:FOLLOWS]->(u3),
(u2)-[:FOLLOWS]->(u4),
(u3)-[:FOLLOWS]->(u5),
(u4)-[:FOLLOWS]->(u5),
(u5)-[:FOLLOWS]->(u6),
(u6)-[:FOLLOWS]->(u1);



// ========================================
// POSTS
// ========================================

CREATE

(p1:Post {postId: 1, content: "Learning Neo4j"}),
(p2:Post {postId: 2, content: "Graph databases are powerful"}),
(p3:Post {postId: 3, content: "Data Analytics career"}),
(p4:Post {postId: 4, content: "Cypher is interesting"});



// ========================================
// POSTED RELATIONSHIP
// ========================================

CREATE

(u1)-[:POSTED]->(p1),
(u2)-[:POSTED]->(p2),
(u3)-[:POSTED]->(p3),
(u4)-[:POSTED]->(p4);



// ========================================
// LIKES
// ========================================

CREATE

(u2)-[:LIKED]->(p1),
(u3)-[:LIKED]->(p1),
(u4)-[:LIKED]->(p1),

(u1)-[:LIKED]->(p2),
(u3)-[:LIKED]->(p2),

(u5)-[:LIKED]->(p3),
(u6)-[:LIKED]->(p3),

(u1)-[:LIKED]->(p4),
(u2)-[:LIKED]->(p4);



// ========================================
// TOPICS
// ========================================

CREATE

(t1:Topic {name: "Neo4j"}),
(t2:Topic {name: "Graph Database"}),
(t3:Topic {name: "Data Analytics"}),
(t4:Topic {name: "Cypher"});



// ========================================
// HAS_TOPIC
// ========================================

CREATE

(p1)-[:HAS_TOPIC]->(t1),
(p2)-[:HAS_TOPIC]->(t2),
(p3)-[:HAS_TOPIC]->(t3),
(p4)-[:HAS_TOPIC]->(t4);