
CREATE DATABASE IF NOT EXISTS ProjetoLeilao;
use projetoleilao;

Create table Pessoa(
idPessoa int primary key auto_increment,
nome varchar(50),
email varchar(50) unique not null
);

Create table Artista(
IdArtista int Primary key auto_increment,
nacionalidade varchar(20) not null,
dataNascimento date,
id_pessoa_fk int not null unique,
foreign key(id_pessoa_fk) references pessoa(idPessoa)
);

Create table Colecionador(
IdColecionador int primary key auto_increment,
cidade varchar(30) not null,
limiteCredito double not null,
id_pessoa_fk int not null unique,
foreign key(id_pessoa_fk) references pessoa(idPessoa)
);

Create table Avaliador(
IdAvaliador int primary key auto_increment,
especialidade varchar(30) not null,
id_pessoa_fk int not null unique,
foreign key(id_pessoa_fk) references pessoa(idPessoa)
);

Create table Obras(
IdObras int primary key auto_increment,
titulo varchar(100) not null,
tipoObra Enum('Pintura','Escultura', 'Fotografia') not null,
anoCriacao date,
valorAvaliado double,
statusObra Enum('Disponivel', 'Em_Leilao', 'Vendida') not null default 'Disponivel',
tecnica varchar(100),
material varchar(100),
id_artista_fk int not null,
foreign key(id_artista_fk) references artista(idArtista)
);

Create table Avaliacoes(
idAvaliacoes int primary key auto_increment,
valor double not null,
dataAvaliacao date not null,
id_Obra_fk int not null,
foreign key(id_obra_fk) references Obras(idObras),
id_avaliador_fk int not null,
foreign key(id_avaliador_fk) references Avaliador(idAvaliador)
);

Create table leilao(
IdLeilao int primary key auto_increment,
nome varchar(50) not null,
dataInicio date not null,
dataFim date not null,
statusLeilao Enum('Agendado','Aberto', 'Encerrado') not null
);

Create table ItemLeilao(
idItemleilao int primary key auto_increment,
lanceInicial double,
lanceMinimo double not null,
statusItem Enum('Vendido', 'Aberto', 'Sem_Vencedor'),
id_Obras_fk int not null,
foreign key(id_obras_fk) references Obras (idObras),
id_leilao_fk int not null,
foreign key(id_leilao_fk) references Leilao (idLeilao)
);

create table lances(
idLances int primary key auto_increment,
valor double not null,
dataHoraLance dateTime not null,
id_item_leilao_fk int not null,
foreign key(id_item_leilao_fk) references ItemLeilao(idItemLeilao),
id_colecionador_fk int not null,
foreign key(id_colecionador_fk) references colecionador (idColecionador)
);

Create table Vendas(
idVendas int primary key auto_increment,
dataVenda date not null,
valorFinal double not null,
formaPagamento Enum('Cartao_Credito', 'Cartao_Debito','Pix') not null,
id_item_leilao_fk int not null unique,
foreign key(id_item_leilao_fk) references ItemLeilao(idItemLeilao),
id_colecionador_fk int not null,
foreign key(id_colecionador_fk) references colecionador (idColecionador)
);


