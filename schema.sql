PRAGMA foreign_keys = ON;

CREATE TABLE participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

CREATE TABLE evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY (id_inscricao) REFERENCES inscricao(id)
);

CREATE TABLE inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY (id_evento) REFERENCES evento(id),
    FOREIGN KEY (id_participante) REFERENCES participante(id)
);

/* participantes */

INSERT INTO participante (nome, email, telefone) VALUES
('Roger Waters', 'roger.waters@hotmail.com', '3491111-1111'),
('Oliver Sykes', 'Oliver.Sykes@hotmail.com', '3492222-2222'),
('Kurt Kobain', 'kurt.cobain@hotmail.com', '3493333-3333');

/* eventos */

INSERT INTO evento (nome, descricao, local, data) VALUES
('Conferência de Tecnologia', 'Discutindo inovações no mundo da tecnologia', 'Centro de Convenções', '15/10/2025'),
('Curso de Desenvolvimento Web', 'Aprenda a desenvolver seu primeiro site', 'Sala 203', '20/10/2025');

/* inscrições */

INSERT INTO inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '10/10/2025', 'confirmada'),
(1, 2, '12/10/2025', 'pendente'),
(2, 3, '13/10/2025', 'confirmada'),
(2, 1, '14/10/2025', 'pendente');

/* pagamentos */

INSERT INTO pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 200.00, '16/10/2025', 'pago'),
(2, 200.00, '17/10/2025', 'pendente'),
(3, 250.00, '18/10/2025', 'pago'),
(4, 250.00, '19/10/2025', 'pendente');
