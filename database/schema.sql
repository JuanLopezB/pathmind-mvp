-- PathMind MVP - esquema inicial PostgreSQL 16
CREATE TABLE users(
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL,
  active BOOLEAN DEFAULT TRUE
);
CREATE TABLE students(
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  grade INTEGER NOT NULL,
  institution VARCHAR(150),
  birth_date DATE,
  CONSTRAINT fk_student_user FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE riasec_results(
  id BIGSERIAL PRIMARY KEY,
  student_id BIGINT NOT NULL,
  realistic INTEGER, investigative INTEGER, artistic INTEGER,
  social INTEGER, enterprising INTEGER, conventional INTEGER,
  FOREIGN KEY(student_id) REFERENCES students(id)
);
CREATE TABLE programs(
  id BIGSERIAL PRIMARY KEY,
  area_id BIGINT,
  name VARCHAR(200),
  institution VARCHAR(200),
  modality VARCHAR(100),
  duration INTEGER,
  approximate_cost DECIMAL(12,2)
);
