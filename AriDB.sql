PGDMP      *                }            AridniDB    17.5    17.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16389    AridniDB    DATABASE     ~   CREATE DATABASE "AridniDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "AridniDB";
                     Aridni    false            �            1259    16395    puntuaciones    TABLE     S   CREATE TABLE public.puntuaciones (
    id_jugador integer,
    marcador integer
);
     DROP TABLE public.puntuaciones;
       public         heap r       postgres    false                      0    16395    puntuaciones 
   TABLE DATA           <   COPY public.puntuaciones (id_jugador, marcador) FROM stdin;
    public               postgres    false    217   %          6   x��� !�7�5�bi.�g;!�ڭ���.5t�����50���oI��     