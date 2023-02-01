--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.1

-- Started on 2023-01-27 13:18:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 19190)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 5802 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 2 (class 3079 OID 18176)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5803 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 19191)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 5804 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- TOC entry 4 (class 3079 OID 50393)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 5805 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- TOC entry 1146 (class 1255 OID 19352)
-- Name: addbbox(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.addbbox(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_addBBOX';


ALTER FUNCTION public.addbbox(public.geometry) OWNER TO postgres;

--
-- TOC entry 1149 (class 1255 OID 19402)
-- Name: addpoint(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.addpoint(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_addpoint';


ALTER FUNCTION public.addpoint(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 931 (class 1255 OID 19403)
-- Name: addpoint(public.geometry, public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.addpoint(public.geometry, public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_addpoint';


ALTER FUNCTION public.addpoint(public.geometry, public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 1150 (class 1255 OID 19392)
-- Name: affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


ALTER FUNCTION public.affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 905 (class 1255 OID 19391)
-- Name: affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_affine';


ALTER FUNCTION public.affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 932 (class 1255 OID 19404)
-- Name: area(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.area(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_Area';


ALTER FUNCTION public.area(public.geometry) OWNER TO postgres;

--
-- TOC entry 1151 (class 1255 OID 19405)
-- Name: area2d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.area2d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_Area';


ALTER FUNCTION public.area2d(public.geometry) OWNER TO postgres;

--
-- TOC entry 883 (class 1255 OID 19340)
-- Name: asbinary(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asbinary(public.geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asBinary';


ALTER FUNCTION public.asbinary(public.geometry) OWNER TO postgres;

--
-- TOC entry 1152 (class 1255 OID 19341)
-- Name: asbinary(public.geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asbinary(public.geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asBinary';


ALTER FUNCTION public.asbinary(public.geometry, text) OWNER TO postgres;

--
-- TOC entry 933 (class 1255 OID 19406)
-- Name: asewkb(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asewkb(public.geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'WKBFromLWGEOM';


ALTER FUNCTION public.asewkb(public.geometry) OWNER TO postgres;

--
-- TOC entry 934 (class 1255 OID 19407)
-- Name: asewkb(public.geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asewkb(public.geometry, text) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'WKBFromLWGEOM';


ALTER FUNCTION public.asewkb(public.geometry, text) OWNER TO postgres;

--
-- TOC entry 935 (class 1255 OID 19408)
-- Name: asewkt(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asewkt(public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asEWKT';


ALTER FUNCTION public.asewkt(public.geometry) OWNER TO postgres;

--
-- TOC entry 1153 (class 1255 OID 19409)
-- Name: asgml(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asgml(public.geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0, null, null)$_$;


ALTER FUNCTION public.asgml(public.geometry) OWNER TO postgres;

--
-- TOC entry 936 (class 1255 OID 19410)
-- Name: asgml(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.asgml(public.geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0, null, null)$_$;


ALTER FUNCTION public.asgml(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 937 (class 1255 OID 19414)
-- Name: ashexewkb(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ashexewkb(public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION public.ashexewkb(public.geometry) OWNER TO postgres;

--
-- TOC entry 938 (class 1255 OID 19415)
-- Name: ashexewkb(public.geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ashexewkb(public.geometry, text) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION public.ashexewkb(public.geometry, text) OWNER TO postgres;

--
-- TOC entry 939 (class 1255 OID 19412)
-- Name: askml(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.askml(public.geometry) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_AsKML(ST_Transform($1,4326), 15, null)$_$;


ALTER FUNCTION public.askml(public.geometry) OWNER TO postgres;

--
-- TOC entry 1154 (class 1255 OID 19411)
-- Name: askml(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.askml(public.geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_AsKML(ST_transform($1,4326), $2, null)$_$;


ALTER FUNCTION public.askml(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 940 (class 1255 OID 19413)
-- Name: askml(integer, public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.askml(integer, public.geometry, integer) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_AsKML(ST_Transform($2,4326), $3, null)$_$;


ALTER FUNCTION public.askml(integer, public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 941 (class 1255 OID 19416)
-- Name: assvg(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.assvg(public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asSVG';


ALTER FUNCTION public.assvg(public.geometry) OWNER TO postgres;

--
-- TOC entry 942 (class 1255 OID 19417)
-- Name: assvg(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.assvg(public.geometry, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asSVG';


ALTER FUNCTION public.assvg(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 943 (class 1255 OID 19418)
-- Name: assvg(public.geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.assvg(public.geometry, integer, integer) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asSVG';


ALTER FUNCTION public.assvg(public.geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 884 (class 1255 OID 19342)
-- Name: astext(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.astext(public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_asText';


ALTER FUNCTION public.astext(public.geometry) OWNER TO postgres;

--
-- TOC entry 1155 (class 1255 OID 19419)
-- Name: azimuth(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.azimuth(public.geometry, public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_azimuth';


ALTER FUNCTION public.azimuth(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1156 (class 1255 OID 19421)
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.bdmpolyfromtext(text, integer) RETURNS public.geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_Multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;


ALTER FUNCTION public.bdmpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 944 (class 1255 OID 19420)
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.bdpolyfromtext(text, integer) RETURNS public.geometry
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


ALTER FUNCTION public.bdpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 945 (class 1255 OID 19422)
-- Name: boundary(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.boundary(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'boundary';


ALTER FUNCTION public.boundary(public.geometry) OWNER TO postgres;

--
-- TOC entry 946 (class 1255 OID 19424)
-- Name: buffer(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.buffer(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'buffer';


ALTER FUNCTION public.buffer(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 947 (class 1255 OID 19423)
-- Name: buffer(public.geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.buffer(public.geometry, double precision, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Buffer($1, $2, $3)$_$;


ALTER FUNCTION public.buffer(public.geometry, double precision, integer) OWNER TO postgres;

--
-- TOC entry 948 (class 1255 OID 19425)
-- Name: buildarea(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.buildarea(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'ST_BuildArea';


ALTER FUNCTION public.buildarea(public.geometry) OWNER TO postgres;

--
-- TOC entry 949 (class 1255 OID 19426)
-- Name: centroid(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.centroid(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'centroid';


ALTER FUNCTION public.centroid(public.geometry) OWNER TO postgres;

--
-- TOC entry 1160 (class 1255 OID 19609)
-- Name: collect(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.collect(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-3', 'LWGEOM_collect';


ALTER FUNCTION public.collect(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1089 (class 1255 OID 19610)
-- Name: combine_bbox(public.box2d, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.combine_bbox(public.box2d, public.geometry) RETURNS public.box2d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-3', 'BOX2D_combine';


ALTER FUNCTION public.combine_bbox(public.box2d, public.geometry) OWNER TO postgres;

--
-- TOC entry 1090 (class 1255 OID 19611)
-- Name: combine_bbox(public.box3d, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.combine_bbox(public.box3d, public.geometry) RETURNS public.box3d
    LANGUAGE c IMMUTABLE
    AS '$libdir/postgis-3', 'BOX3D_combine';


ALTER FUNCTION public.combine_bbox(public.box3d, public.geometry) OWNER TO postgres;

--
-- TOC entry 1088 (class 1255 OID 50400)
-- Name: comment_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.comment_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('C',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM comment
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'C01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.comment_code_update() OWNER TO postgres;

--
-- TOC entry 950 (class 1255 OID 19427)
-- Name: contains(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.contains(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'contains';


ALTER FUNCTION public.contains(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 951 (class 1255 OID 19428)
-- Name: convexhull(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.convexhull(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'convexhull';


ALTER FUNCTION public.convexhull(public.geometry) OWNER TO postgres;

--
-- TOC entry 952 (class 1255 OID 19429)
-- Name: crosses(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.crosses(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'crosses';


ALTER FUNCTION public.crosses(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 953 (class 1255 OID 19431)
-- Name: difference(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.difference(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_Difference';


ALTER FUNCTION public.difference(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 954 (class 1255 OID 19432)
-- Name: dimension(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dimension(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_dimension';


ALTER FUNCTION public.dimension(public.geometry) OWNER TO postgres;

--
-- TOC entry 1165 (class 1255 OID 19433)
-- Name: disjoint(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.disjoint(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'disjoint';


ALTER FUNCTION public.disjoint(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 955 (class 1255 OID 19430)
-- Name: distance(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.distance(public.geometry, public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'ST_Distance';


ALTER FUNCTION public.distance(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 956 (class 1255 OID 19434)
-- Name: distance_sphere(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.distance_sphere(public.geometry, public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'LWGEOM_distance_sphere';


ALTER FUNCTION public.distance_sphere(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 957 (class 1255 OID 19435)
-- Name: distance_spheroid(public.geometry, public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.distance_spheroid(public.geometry, public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'LWGEOM_distance_ellipsoid';


ALTER FUNCTION public.distance_spheroid(public.geometry, public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 885 (class 1255 OID 19353)
-- Name: dropbbox(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dropbbox(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_dropBBOX';


ALTER FUNCTION public.dropbbox(public.geometry) OWNER TO postgres;

--
-- TOC entry 1169 (class 1255 OID 19436)
-- Name: dump(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dump(public.geometry) RETURNS SETOF public.geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_dump';


ALTER FUNCTION public.dump(public.geometry) OWNER TO postgres;

--
-- TOC entry 1170 (class 1255 OID 19437)
-- Name: dumprings(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dumprings(public.geometry) RETURNS SETOF public.geometry_dump
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_dump_rings';


ALTER FUNCTION public.dumprings(public.geometry) OWNER TO postgres;

--
-- TOC entry 958 (class 1255 OID 19445)
-- Name: endpoint(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.endpoint(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_endpoint_linestring';


ALTER FUNCTION public.endpoint(public.geometry) OWNER TO postgres;

--
-- TOC entry 959 (class 1255 OID 19438)
-- Name: envelope(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.envelope(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_envelope';


ALTER FUNCTION public.envelope(public.geometry) OWNER TO postgres;

--
-- TOC entry 886 (class 1255 OID 19344)
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.estimated_extent(text, text) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-3', 'geometry_estimated_extent';


ALTER FUNCTION public.estimated_extent(text, text) OWNER TO postgres;

--
-- TOC entry 1172 (class 1255 OID 19343)
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.estimated_extent(text, text, text) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-3', 'geometry_estimated_extent';


ALTER FUNCTION public.estimated_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 960 (class 1255 OID 19439)
-- Name: expand(public.box2d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.expand(public.box2d, double precision) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX2D_expand';


ALTER FUNCTION public.expand(public.box2d, double precision) OWNER TO postgres;

--
-- TOC entry 961 (class 1255 OID 19440)
-- Name: expand(public.box3d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.expand(public.box3d, double precision) RETURNS public.box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_expand';


ALTER FUNCTION public.expand(public.box3d, double precision) OWNER TO postgres;

--
-- TOC entry 1173 (class 1255 OID 19441)
-- Name: expand(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.expand(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_expand';


ALTER FUNCTION public.expand(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 962 (class 1255 OID 19446)
-- Name: exteriorring(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.exteriorring(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_exteriorring_polygon';


ALTER FUNCTION public.exteriorring(public.geometry) OWNER TO postgres;

--
-- TOC entry 1174 (class 1255 OID 19443)
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_extent(text, text) RETURNS public.box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") As extent FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION public.find_extent(text, text) OWNER TO postgres;

--
-- TOC entry 963 (class 1255 OID 19444)
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.find_extent(text, text, text) RETURNS public.box2d
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT ST_Extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '" As extent ' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION public.find_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 1175 (class 1255 OID 19383)
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fix_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	
	return 'This function is obsolete now that geometry_columns is a view';

END;
$$;


ALTER FUNCTION public.fix_geometry_columns() OWNER TO postgres;

--
-- TOC entry 964 (class 1255 OID 19447)
-- Name: force_2d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.force_2d(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_2d';


ALTER FUNCTION public.force_2d(public.geometry) OWNER TO postgres;

--
-- TOC entry 965 (class 1255 OID 19448)
-- Name: force_3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.force_3d(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_3dz';


ALTER FUNCTION public.force_3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 966 (class 1255 OID 19449)
-- Name: force_3dm(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.force_3dm(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_3dm';


ALTER FUNCTION public.force_3dm(public.geometry) OWNER TO postgres;

--
-- TOC entry 967 (class 1255 OID 19450)
-- Name: force_3dz(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.force_3dz(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_3dz';


ALTER FUNCTION public.force_3dz(public.geometry) OWNER TO postgres;

--
-- TOC entry 968 (class 1255 OID 19451)
-- Name: force_4d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.force_4d(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_4d';


ALTER FUNCTION public.force_4d(public.geometry) OWNER TO postgres;

--
-- TOC entry 969 (class 1255 OID 19452)
-- Name: force_collection(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.force_collection(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_collection';


ALTER FUNCTION public.force_collection(public.geometry) OWNER TO postgres;

--
-- TOC entry 970 (class 1255 OID 19453)
-- Name: forcerhr(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.forcerhr(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_clockwise_poly';


ALTER FUNCTION public.forcerhr(public.geometry) OWNER TO postgres;

--
-- TOC entry 1182 (class 1255 OID 19455)
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomcollfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.geomcollfromtext(text) OWNER TO postgres;

--
-- TOC entry 971 (class 1255 OID 19454)
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomcollfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.geomcollfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 972 (class 1255 OID 19457)
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomcollfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.geomcollfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 973 (class 1255 OID 19456)
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomcollfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.geomcollfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 887 (class 1255 OID 19357)
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geometryfromtext(text) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_from_text';


ALTER FUNCTION public.geometryfromtext(text) OWNER TO postgres;

--
-- TOC entry 888 (class 1255 OID 19356)
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geometryfromtext(text, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_from_text';


ALTER FUNCTION public.geometryfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 974 (class 1255 OID 19458)
-- Name: geometryn(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geometryn(public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_geometryn_collection';


ALTER FUNCTION public.geometryn(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 889 (class 1255 OID 19346)
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeomFromText($1)$_$;


ALTER FUNCTION public.geomfromtext(text) OWNER TO postgres;

--
-- TOC entry 890 (class 1255 OID 19345)
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_GeomFromText($1, $2)$_$;


ALTER FUNCTION public.geomfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1220 (class 1255 OID 19358)
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomfromwkb(bytea) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_from_WKB';


ALTER FUNCTION public.geomfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 891 (class 1255 OID 19359)
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


ALTER FUNCTION public.geomfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 975 (class 1255 OID 19459)
-- Name: geomunion(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.geomunion(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_Union';


ALTER FUNCTION public.geomunion(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 976 (class 1255 OID 19460)
-- Name: getbbox(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getbbox(public.geometry) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_to_BOX2D';


ALTER FUNCTION public.getbbox(public.geometry) OWNER TO postgres;

--
-- TOC entry 892 (class 1255 OID 19355)
-- Name: getsrid(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getsrid(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_get_srid';


ALTER FUNCTION public.getsrid(public.geometry) OWNER TO postgres;

--
-- TOC entry 893 (class 1255 OID 19354)
-- Name: hasbbox(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hasbbox(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_hasBBOX';


ALTER FUNCTION public.hasbbox(public.geometry) OWNER TO postgres;

--
-- TOC entry 1223 (class 1255 OID 19476)
-- Name: interiorringn(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.interiorringn(public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_interiorringn_polygon';


ALTER FUNCTION public.interiorringn(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 984 (class 1255 OID 19477)
-- Name: intersection(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.intersection(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_Intersection';


ALTER FUNCTION public.intersection(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1224 (class 1255 OID 19461)
-- Name: intersects(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.intersects(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_Intersects';


ALTER FUNCTION public.intersects(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 985 (class 1255 OID 19478)
-- Name: isclosed(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.isclosed(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_isclosed';


ALTER FUNCTION public.isclosed(public.geometry) OWNER TO postgres;

--
-- TOC entry 1225 (class 1255 OID 19479)
-- Name: isempty(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.isempty(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_isempty';


ALTER FUNCTION public.isempty(public.geometry) OWNER TO postgres;

--
-- TOC entry 977 (class 1255 OID 19462)
-- Name: isring(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.isring(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'isring';


ALTER FUNCTION public.isring(public.geometry) OWNER TO postgres;

--
-- TOC entry 978 (class 1255 OID 19463)
-- Name: issimple(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.issimple(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'issimple';


ALTER FUNCTION public.issimple(public.geometry) OWNER TO postgres;

--
-- TOC entry 986 (class 1255 OID 19480)
-- Name: isvalid(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.isvalid(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'isvalid';


ALTER FUNCTION public.isvalid(public.geometry) OWNER TO postgres;

--
-- TOC entry 987 (class 1255 OID 19483)
-- Name: length(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.length(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_length_linestring';


ALTER FUNCTION public.length(public.geometry) OWNER TO postgres;

--
-- TOC entry 988 (class 1255 OID 19482)
-- Name: length2d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.length2d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_length2d_linestring';


ALTER FUNCTION public.length2d(public.geometry) OWNER TO postgres;

--
-- TOC entry 979 (class 1255 OID 19465)
-- Name: length2d_spheroid(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.length2d_spheroid(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'LWGEOM_length2d_ellipsoid';


ALTER FUNCTION public.length2d_spheroid(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 1227 (class 1255 OID 19481)
-- Name: length3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.length3d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_length_linestring';


ALTER FUNCTION public.length3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1228 (class 1255 OID 19466)
-- Name: length3d_spheroid(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.length3d_spheroid(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.length3d_spheroid(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 980 (class 1255 OID 19464)
-- Name: length_spheroid(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.length_spheroid(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.length_spheroid(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 989 (class 1255 OID 19484)
-- Name: line_interpolate_point(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.line_interpolate_point(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_line_interpolate_point';


ALTER FUNCTION public.line_interpolate_point(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 990 (class 1255 OID 19485)
-- Name: line_locate_point(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.line_locate_point(public.geometry, public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_line_locate_point';


ALTER FUNCTION public.line_locate_point(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 991 (class 1255 OID 19486)
-- Name: line_substring(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.line_substring(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_line_substring';


ALTER FUNCTION public.line_substring(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 992 (class 1255 OID 19489)
-- Name: linefrommultipoint(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linefrommultipoint(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_line_from_mpoint';


ALTER FUNCTION public.linefrommultipoint(public.geometry) OWNER TO postgres;

--
-- TOC entry 1229 (class 1255 OID 19487)
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linefromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.linefromtext(text) OWNER TO postgres;

--
-- TOC entry 993 (class 1255 OID 19488)
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linefromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.linefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 994 (class 1255 OID 19491)
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linefromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.linefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 995 (class 1255 OID 19490)
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linefromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.linefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 981 (class 1255 OID 19467)
-- Name: linemerge(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linemerge(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'linemerge';


ALTER FUNCTION public.linemerge(public.geometry) OWNER TO postgres;

--
-- TOC entry 996 (class 1255 OID 19492)
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linestringfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1)$_$;


ALTER FUNCTION public.linestringfromtext(text) OWNER TO postgres;

--
-- TOC entry 1230 (class 1255 OID 19493)
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linestringfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1, $2)$_$;


ALTER FUNCTION public.linestringfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 997 (class 1255 OID 19495)
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linestringfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.linestringfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 998 (class 1255 OID 19494)
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.linestringfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.linestringfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 982 (class 1255 OID 19468)
-- Name: locate_along_measure(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.locate_along_measure(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_LocateBetween($1, $2, $2) $_$;


ALTER FUNCTION public.locate_along_measure(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 999 (class 1255 OID 19496)
-- Name: locate_between_measures(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.locate_between_measures(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_locate_between_m';


ALTER FUNCTION public.locate_between_measures(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1000 (class 1255 OID 19497)
-- Name: m(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.m(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_m_point';


ALTER FUNCTION public.m(public.geometry) OWNER TO postgres;

--
-- TOC entry 983 (class 1255 OID 19469)
-- Name: makebox2d(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makebox2d(public.geometry, public.geometry) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX2D_construct';


ALTER FUNCTION public.makebox2d(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1234 (class 1255 OID 19498)
-- Name: makebox3d(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makebox3d(public.geometry, public.geometry) RETURNS public.box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_construct';


ALTER FUNCTION public.makebox3d(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1001 (class 1255 OID 19501)
-- Name: makeline(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makeline(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makeline';


ALTER FUNCTION public.makeline(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1002 (class 1255 OID 19499)
-- Name: makeline_garray(public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makeline_garray(public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makeline_garray';


ALTER FUNCTION public.makeline_garray(public.geometry[]) OWNER TO postgres;

--
-- TOC entry 1003 (class 1255 OID 19502)
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makepoint(double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makepoint';


ALTER FUNCTION public.makepoint(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1235 (class 1255 OID 19503)
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makepoint(double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makepoint';


ALTER FUNCTION public.makepoint(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1236 (class 1255 OID 19504)
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makepoint(double precision, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makepoint';


ALTER FUNCTION public.makepoint(double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1011 (class 1255 OID 19505)
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makepointm(double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makepoint3dm';


ALTER FUNCTION public.makepointm(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1004 (class 1255 OID 19471)
-- Name: makepolygon(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makepolygon(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makepoly';


ALTER FUNCTION public.makepolygon(public.geometry) OWNER TO postgres;

--
-- TOC entry 1005 (class 1255 OID 19470)
-- Name: makepolygon(public.geometry, public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makepolygon(public.geometry, public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makepoly';


ALTER FUNCTION public.makepolygon(public.geometry, public.geometry[]) OWNER TO postgres;

--
-- TOC entry 1237 (class 1255 OID 19506)
-- Name: max_distance(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.max_distance(public.geometry, public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_maxdistance2d_linestring';


ALTER FUNCTION public.max_distance(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1012 (class 1255 OID 19507)
-- Name: mem_size(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mem_size(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_mem_size';


ALTER FUNCTION public.mem_size(public.geometry) OWNER TO postgres;

--
-- TOC entry 1013 (class 1255 OID 19509)
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mlinefromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mlinefromtext(text) OWNER TO postgres;

--
-- TOC entry 1014 (class 1255 OID 19508)
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mlinefromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mlinefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1238 (class 1255 OID 19511)
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mlinefromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mlinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1015 (class 1255 OID 19510)
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mlinefromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mlinefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1016 (class 1255 OID 19513)
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpointfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpointfromtext(text) OWNER TO postgres;

--
-- TOC entry 1017 (class 1255 OID 19512)
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpointfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1018 (class 1255 OID 19515)
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpointfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1239 (class 1255 OID 19514)
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpointfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1019 (class 1255 OID 19517)
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpolyfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpolyfromtext(text) OWNER TO postgres;

--
-- TOC entry 1020 (class 1255 OID 19516)
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpolyfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1006 (class 1255 OID 19472)
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpolyfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1021 (class 1255 OID 19518)
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.mpolyfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.mpolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1007 (class 1255 OID 19473)
-- Name: multi(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multi(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_force_multi';


ALTER FUNCTION public.multi(public.geometry) OWNER TO postgres;

--
-- TOC entry 1022 (class 1255 OID 19520)
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multilinefromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.multilinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1023 (class 1255 OID 19519)
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multilinefromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.multilinefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1009 (class 1255 OID 19521)
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multilinestringfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


ALTER FUNCTION public.multilinestringfromtext(text) OWNER TO postgres;

--
-- TOC entry 1240 (class 1255 OID 19522)
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multilinestringfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


ALTER FUNCTION public.multilinestringfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1024 (class 1255 OID 19523)
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipointfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


ALTER FUNCTION public.multipointfromtext(text) OWNER TO postgres;

--
-- TOC entry 1010 (class 1255 OID 19524)
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipointfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1, $2)$_$;


ALTER FUNCTION public.multipointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1025 (class 1255 OID 19526)
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipointfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.multipointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1241 (class 1255 OID 19525)
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipointfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.multipointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1242 (class 1255 OID 19475)
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipolyfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.multipolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1008 (class 1255 OID 19474)
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipolyfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.multipolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1026 (class 1255 OID 19528)
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipolygonfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


ALTER FUNCTION public.multipolygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 1027 (class 1255 OID 19527)
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.multipolygonfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


ALTER FUNCTION public.multipolygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 894 (class 1255 OID 19347)
-- Name: ndims(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ndims(public.geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_ndims';


ALTER FUNCTION public.ndims(public.geometry) OWNER TO postgres;

--
-- TOC entry 1243 (class 1255 OID 19360)
-- Name: noop(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.noop(public.geometry) RETURNS public.geometry
    LANGUAGE c STRICT
    AS '$libdir/postgis-3', 'LWGEOM_noop';


ALTER FUNCTION public.noop(public.geometry) OWNER TO postgres;

--
-- TOC entry 1244 (class 1255 OID 19531)
-- Name: npoints(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.npoints(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_npoints';


ALTER FUNCTION public.npoints(public.geometry) OWNER TO postgres;

--
-- TOC entry 1245 (class 1255 OID 19532)
-- Name: nrings(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nrings(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_nrings';


ALTER FUNCTION public.nrings(public.geometry) OWNER TO postgres;

--
-- TOC entry 1246 (class 1255 OID 19533)
-- Name: numgeometries(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numgeometries(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_numgeometries_collection';


ALTER FUNCTION public.numgeometries(public.geometry) OWNER TO postgres;

--
-- TOC entry 1028 (class 1255 OID 19529)
-- Name: numinteriorring(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numinteriorring(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION public.numinteriorring(public.geometry) OWNER TO postgres;

--
-- TOC entry 1029 (class 1255 OID 19530)
-- Name: numinteriorrings(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numinteriorrings(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION public.numinteriorrings(public.geometry) OWNER TO postgres;

--
-- TOC entry 1030 (class 1255 OID 19534)
-- Name: numpoints(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numpoints(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_numpoints_linestring';


ALTER FUNCTION public.numpoints(public.geometry) OWNER TO postgres;

--
-- TOC entry 1247 (class 1255 OID 50401)
-- Name: other_substance_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.other_substance_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('Z',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM other_substance
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'Z01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.other_substance_code_update() OWNER TO postgres;

--
-- TOC entry 1248 (class 1255 OID 19535)
-- Name: overlaps(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."overlaps"(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'overlaps';


ALTER FUNCTION public."overlaps"(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1251 (class 1255 OID 19537)
-- Name: perimeter2d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.perimeter2d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION public.perimeter2d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1252 (class 1255 OID 19536)
-- Name: perimeter3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.perimeter3d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_perimeter_poly';


ALTER FUNCTION public.perimeter3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1104 (class 1255 OID 50402)
-- Name: photo_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.photo_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('I',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM photo
    WHERE report=new.report or episode=new.episode
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'I01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.photo_code_update() OWNER TO postgres;

--
-- TOC entry 1031 (class 1255 OID 19538)
-- Name: point_inside_circle(public.geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.point_inside_circle(public.geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_inside_circle_point';


ALTER FUNCTION public.point_inside_circle(public.geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1032 (class 1255 OID 19539)
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pointfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.pointfromtext(text) OWNER TO postgres;

--
-- TOC entry 1232 (class 1255 OID 19540)
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pointfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.pointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1033 (class 1255 OID 19541)
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pointfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.pointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1034 (class 1255 OID 19542)
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pointfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.pointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1035 (class 1255 OID 19543)
-- Name: pointn(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pointn(public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_pointn_linestring';


ALTER FUNCTION public.pointn(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 1036 (class 1255 OID 19544)
-- Name: pointonsurface(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pointonsurface(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'pointonsurface';


ALTER FUNCTION public.pointonsurface(public.geometry) OWNER TO postgres;

--
-- TOC entry 1105 (class 1255 OID 50403)
-- Name: pollution_source_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pollution_source_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('F',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM pollution_source
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'F01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.pollution_source_code_update() OWNER TO postgres;

--
-- TOC entry 1037 (class 1255 OID 19545)
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polyfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.polyfromtext(text) OWNER TO postgres;

--
-- TOC entry 1256 (class 1255 OID 19546)
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polyfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.polyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1038 (class 1255 OID 19548)
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polyfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.polyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1039 (class 1255 OID 19547)
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polyfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.polyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1040 (class 1255 OID 19550)
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polygonfromtext(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1)$_$;


ALTER FUNCTION public.polygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 1041 (class 1255 OID 19549)
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polygonfromtext(text, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


ALTER FUNCTION public.polygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 1042 (class 1255 OID 19552)
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polygonfromwkb(bytea) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.polygonfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 1258 (class 1255 OID 19551)
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polygonfromwkb(bytea, integer) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION public.polygonfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 1043 (class 1255 OID 19553)
-- Name: polygonize_garray(public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.polygonize_garray(public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'polygonize_garray';


ALTER FUNCTION public.polygonize_garray(public.geometry[]) OWNER TO postgres;

--
-- TOC entry 906 (class 1255 OID 19384)
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.probe_geometry_columns() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN


	RETURN 'This function is obsolete now that geometry_columns is a view';
END

$$;


ALTER FUNCTION public.probe_geometry_columns() OWNER TO postgres;

--
-- TOC entry 1044 (class 1255 OID 19554)
-- Name: relate(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.relate(public.geometry, public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'relate_full';


ALTER FUNCTION public.relate(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1045 (class 1255 OID 19555)
-- Name: relate(public.geometry, public.geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.relate(public.geometry, public.geometry, text) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'relate_pattern';


ALTER FUNCTION public.relate(public.geometry, public.geometry, text) OWNER TO postgres;

--
-- TOC entry 1046 (class 1255 OID 19556)
-- Name: removepoint(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.removepoint(public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_removepoint';


ALTER FUNCTION public.removepoint(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 907 (class 1255 OID 19382)
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rename_geometry_table_constraints() RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;


ALTER FUNCTION public.rename_geometry_table_constraints() OWNER TO postgres;

--
-- TOC entry 1047 (class 1255 OID 19557)
-- Name: reverse(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.reverse(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_reverse';


ALTER FUNCTION public.reverse(public.geometry) OWNER TO postgres;

--
-- TOC entry 908 (class 1255 OID 19394)
-- Name: rotate(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rotate(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_rotateZ($1, $2)$_$;


ALTER FUNCTION public.rotate(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 909 (class 1255 OID 19395)
-- Name: rotatex(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rotatex(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


ALTER FUNCTION public.rotatex(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 910 (class 1255 OID 19396)
-- Name: rotatey(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rotatey(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


ALTER FUNCTION public.rotatey(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 911 (class 1255 OID 19393)
-- Name: rotatez(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rotatez(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


ALTER FUNCTION public.rotatez(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 912 (class 1255 OID 19398)
-- Name: scale(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.scale(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_scale($1, $2, $3, 1)$_$;


ALTER FUNCTION public.scale(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 913 (class 1255 OID 19397)
-- Name: scale(public.geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.scale(public.geometry, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


ALTER FUNCTION public.scale(public.geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1106 (class 1255 OID 50404)
-- Name: scat_zone_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.scat_zone_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('Z',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM scat_zone
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'Z01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.scat_zone_code_update() OWNER TO postgres;

--
-- TOC entry 895 (class 1255 OID 19361)
-- Name: se_envelopesintersect(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_envelopesintersect(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	SELECT $1 && $2
	$_$;


ALTER FUNCTION public.se_envelopesintersect(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 896 (class 1255 OID 19362)
-- Name: se_is3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_is3d(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_hasz';


ALTER FUNCTION public.se_is3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 897 (class 1255 OID 19363)
-- Name: se_ismeasured(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_ismeasured(public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_hasm';


ALTER FUNCTION public.se_ismeasured(public.geometry) OWNER TO postgres;

--
-- TOC entry 1264 (class 1255 OID 19367)
-- Name: se_locatealong(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_locatealong(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT SE_LocateBetween($1, $2, $2) $_$;


ALTER FUNCTION public.se_locatealong(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 1265 (class 1255 OID 19366)
-- Name: se_locatebetween(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_locatebetween(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_locate_between_m';


ALTER FUNCTION public.se_locatebetween(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 898 (class 1255 OID 19365)
-- Name: se_m(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_m(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_m_point';


ALTER FUNCTION public.se_m(public.geometry) OWNER TO postgres;

--
-- TOC entry 899 (class 1255 OID 19364)
-- Name: se_z(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.se_z(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_z_point';


ALTER FUNCTION public.se_z(public.geometry) OWNER TO postgres;

--
-- TOC entry 1266 (class 1255 OID 19558)
-- Name: segmentize(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.segmentize(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_segmentize2d';


ALTER FUNCTION public.segmentize(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 1048 (class 1255 OID 19559)
-- Name: setpoint(public.geometry, integer, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.setpoint(public.geometry, integer, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_setpoint_linestring';


ALTER FUNCTION public.setpoint(public.geometry, integer, public.geometry) OWNER TO postgres;

--
-- TOC entry 900 (class 1255 OID 19348)
-- Name: setsrid(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.setsrid(public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_set_srid';


ALTER FUNCTION public.setsrid(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 1049 (class 1255 OID 19560)
-- Name: shift_longitude(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.shift_longitude(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_longitude_shift';


ALTER FUNCTION public.shift_longitude(public.geometry) OWNER TO postgres;

--
-- TOC entry 1050 (class 1255 OID 19561)
-- Name: simplify(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.simplify(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_simplify2d';


ALTER FUNCTION public.simplify(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 1051 (class 1255 OID 19563)
-- Name: snaptogrid(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.snaptogrid(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


ALTER FUNCTION public.snaptogrid(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 1267 (class 1255 OID 19565)
-- Name: snaptogrid(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.snaptogrid(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


ALTER FUNCTION public.snaptogrid(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1052 (class 1255 OID 19562)
-- Name: snaptogrid(public.geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.snaptogrid(public.geometry, double precision, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_snaptogrid';


ALTER FUNCTION public.snaptogrid(public.geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1053 (class 1255 OID 19564)
-- Name: snaptogrid(public.geometry, public.geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.snaptogrid(public.geometry, public.geometry, double precision, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_snaptogrid_pointoff';


ALTER FUNCTION public.snaptogrid(public.geometry, public.geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1107 (class 1255 OID 50405)
-- Name: spill_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.spill_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('S',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM spill
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'S01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.spill_code_update() OWNER TO postgres;

--
-- TOC entry 901 (class 1255 OID 19349)
-- Name: srid(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.srid(public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_get_srid';


ALTER FUNCTION public.srid(public.geometry) OWNER TO postgres;

--
-- TOC entry 1270 (class 1255 OID 19590)
-- Name: st_3dlength_spheroid(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_3dlength_spheroid(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LengthSpheroid($1,$2);$_$;


ALTER FUNCTION public.st_3dlength_spheroid(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 1275 (class 1255 OID 19350)
-- Name: st_asbinary(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_asbinary(text) RETURNS bytea
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsBinary($1::geometry);$_$;


ALTER FUNCTION public.st_asbinary(text) OWNER TO postgres;

--
-- TOC entry 1091 (class 1255 OID 19623)
-- Name: st_asgeojson(integer, public.geography, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_asgeojson(version integer, geog public.geography, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsGeoJson($2::geometry,$3,$4); $_$;


ALTER FUNCTION public.st_asgeojson(version integer, geog public.geography, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 1092 (class 1255 OID 19624)
-- Name: st_asgeojson(integer, public.geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_asgeojson(version integer, geog public.geometry, maxdecimaldigits integer DEFAULT 15, options integer DEFAULT 0) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsGeoJson($2::geometry,15,0); $_$;


ALTER FUNCTION public.st_asgeojson(version integer, geog public.geometry, maxdecimaldigits integer, options integer) OWNER TO postgres;

--
-- TOC entry 1284 (class 1255 OID 19625)
-- Name: st_askml(integer, public.geography, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_askml(version integer, geom public.geography, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT ''::text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsKML($2::geometry,$3,$4); $_$;


ALTER FUNCTION public.st_askml(version integer, geom public.geography, maxdecimaldigits integer, nprefix text) OWNER TO postgres;

--
-- TOC entry 1093 (class 1255 OID 19626)
-- Name: st_askml(integer, public.geometry, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_askml(version integer, geom public.geometry, maxdecimaldigits integer DEFAULT 15, nprefix text DEFAULT ''::text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsKML($2::geometry,$3,$4); $_$;


ALTER FUNCTION public.st_askml(version integer, geom public.geometry, maxdecimaldigits integer, nprefix text) OWNER TO postgres;

--
-- TOC entry 902 (class 1255 OID 19351)
-- Name: st_astext(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_astext(bytea) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$ SELECT ST_AsText($1::geometry);$_$;


ALTER FUNCTION public.st_astext(bytea) OWNER TO postgres;

--
-- TOC entry 914 (class 1255 OID 19373)
-- Name: st_box(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box(public.box3d) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_to_BOX';


ALTER FUNCTION public.st_box(public.box3d) OWNER TO postgres;

--
-- TOC entry 915 (class 1255 OID 19370)
-- Name: st_box(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box(public.geometry) RETURNS box
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_to_BOX';


ALTER FUNCTION public.st_box(public.geometry) OWNER TO postgres;

--
-- TOC entry 916 (class 1255 OID 19371)
-- Name: st_box2d(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box2d(public.box3d) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_to_BOX2D';


ALTER FUNCTION public.st_box2d(public.box3d) OWNER TO postgres;

--
-- TOC entry 867 (class 1255 OID 19368)
-- Name: st_box2d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box2d(public.geometry) RETURNS public.box2d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_to_BOX2D';


ALTER FUNCTION public.st_box2d(public.geometry) OWNER TO postgres;

--
-- TOC entry 917 (class 1255 OID 19372)
-- Name: st_box3d(public.box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box3d(public.box2d) RETURNS public.box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX2D_to_BOX3D';


ALTER FUNCTION public.st_box3d(public.box2d) OWNER TO postgres;

--
-- TOC entry 918 (class 1255 OID 19369)
-- Name: st_box3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box3d(public.geometry) RETURNS public.box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_to_BOX3D';


ALTER FUNCTION public.st_box3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1292 (class 1255 OID 19380)
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box3d_in(cstring) RETURNS public.box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_in';


ALTER FUNCTION public.st_box3d_in(cstring) OWNER TO postgres;

--
-- TOC entry 919 (class 1255 OID 19381)
-- Name: st_box3d_out(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_box3d_out(public.box3d) RETURNS cstring
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_out';


ALTER FUNCTION public.st_box3d_out(public.box3d) OWNER TO postgres;

--
-- TOC entry 920 (class 1255 OID 19379)
-- Name: st_bytea(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_bytea(public.geometry) RETURNS bytea
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_to_bytea';


ALTER FUNCTION public.st_bytea(public.geometry) OWNER TO postgres;

--
-- TOC entry 1094 (class 1255 OID 19607)
-- Name: st_combine_bbox(public.box2d, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_combine_bbox(public.box2d, public.geometry) RETURNS public.box2d
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT ST_CombineBbox($1,$2);$_$;


ALTER FUNCTION public.st_combine_bbox(public.box2d, public.geometry) OWNER TO postgres;

--
-- TOC entry 1095 (class 1255 OID 19606)
-- Name: st_combine_bbox(public.box3d, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_combine_bbox(public.box3d, public.geometry) RETURNS public.box3d
    LANGUAGE sql IMMUTABLE
    AS $_$SELECT ST_CombineBbox($1,$2);$_$;


ALTER FUNCTION public.st_combine_bbox(public.box3d, public.geometry) OWNER TO postgres;

--
-- TOC entry 1096 (class 1255 OID 19608)
-- Name: st_distance_sphere(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_distance_sphere(geom1 public.geometry, geom2 public.geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_DistanceSphere($1,$2);$_$;


ALTER FUNCTION public.st_distance_sphere(geom1 public.geometry, geom2 public.geometry) OWNER TO postgres;

--
-- TOC entry 1303 (class 1255 OID 19593)
-- Name: st_distance_spheroid(public.geometry, public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_distance_spheroid(geom1 public.geometry, geom2 public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_DistanceSpheroid($1,$2,$3);$_$;


ALTER FUNCTION public.st_distance_spheroid(geom1 public.geometry, geom2 public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 1057 (class 1255 OID 19586)
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_estimated_extent(text, text) RETURNS public.box2d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	-- We use security invoker instead of security definer
	-- to prevent malicious injection of a same named different function
	-- that would be run under elevated permissions
	SELECT ST_EstimatedExtent($1, $2);
	$_$;


ALTER FUNCTION public.st_estimated_extent(text, text) OWNER TO postgres;

--
-- TOC entry 1058 (class 1255 OID 19585)
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_estimated_extent(text, text, text) RETURNS public.box2d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
	-- We use security invoker instead of security definer
	-- to prevent malicious injection of a different same named function
	SELECT ST_EstimatedExtent($1, $2, $3);
	$_$;


ALTER FUNCTION public.st_estimated_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 1059 (class 1255 OID 19588)
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_find_extent(text, text) RETURNS public.box2d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_FindExtent($1,$2);$_$;


ALTER FUNCTION public.st_find_extent(text, text) OWNER TO postgres;

--
-- TOC entry 1060 (class 1255 OID 19587)
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_find_extent(text, text, text) RETURNS public.box2d
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_FindExtent($1,$2,$3);$_$;


ALTER FUNCTION public.st_find_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 1061 (class 1255 OID 19595)
-- Name: st_force_2d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_force_2d(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Force2D($1);$_$;


ALTER FUNCTION public.st_force_2d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1309 (class 1255 OID 19600)
-- Name: st_force_3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_force_3d(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Force3D($1);$_$;


ALTER FUNCTION public.st_force_3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1062 (class 1255 OID 19597)
-- Name: st_force_3dm(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_force_3dm(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Force3DM($1);$_$;


ALTER FUNCTION public.st_force_3dm(public.geometry) OWNER TO postgres;

--
-- TOC entry 1063 (class 1255 OID 19596)
-- Name: st_force_3dz(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_force_3dz(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Force3DZ($1);$_$;


ALTER FUNCTION public.st_force_3dz(public.geometry) OWNER TO postgres;

--
-- TOC entry 1064 (class 1255 OID 19599)
-- Name: st_force_4d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_force_4d(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Force4D($1);$_$;


ALTER FUNCTION public.st_force_4d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1310 (class 1255 OID 19598)
-- Name: st_force_collection(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_force_collection(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_ForceCollection($1);$_$;


ALTER FUNCTION public.st_force_collection(public.geometry) OWNER TO postgres;

--
-- TOC entry 921 (class 1255 OID 19378)
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry(bytea) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_from_bytea';


ALTER FUNCTION public.st_geometry(bytea) OWNER TO postgres;

--
-- TOC entry 1314 (class 1255 OID 19377)
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry(text) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'parse_WKT_lwgeom';


ALTER FUNCTION public.st_geometry(text) OWNER TO postgres;

--
-- TOC entry 922 (class 1255 OID 19375)
-- Name: st_geometry(public.box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry(public.box2d) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX2D_to_LWGEOM';


ALTER FUNCTION public.st_geometry(public.box2d) OWNER TO postgres;

--
-- TOC entry 923 (class 1255 OID 19376)
-- Name: st_geometry(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry(public.box3d) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_to_LWGEOM';


ALTER FUNCTION public.st_geometry(public.box3d) OWNER TO postgres;

--
-- TOC entry 924 (class 1255 OID 19390)
-- Name: st_geometry_cmp(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry_cmp(public.geometry, public.geometry) RETURNS integer
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'lwgeom_cmp';


ALTER FUNCTION public.st_geometry_cmp(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1315 (class 1255 OID 19389)
-- Name: st_geometry_eq(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry_eq(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'lwgeom_eq';


ALTER FUNCTION public.st_geometry_eq(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 925 (class 1255 OID 19388)
-- Name: st_geometry_ge(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry_ge(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'lwgeom_ge';


ALTER FUNCTION public.st_geometry_ge(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 926 (class 1255 OID 19387)
-- Name: st_geometry_gt(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry_gt(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'lwgeom_gt';


ALTER FUNCTION public.st_geometry_gt(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 927 (class 1255 OID 19386)
-- Name: st_geometry_le(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry_le(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'lwgeom_le';


ALTER FUNCTION public.st_geometry_le(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 928 (class 1255 OID 19385)
-- Name: st_geometry_lt(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_geometry_lt(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'lwgeom_lt';


ALTER FUNCTION public.st_geometry_lt(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1065 (class 1255 OID 19592)
-- Name: st_length2d_spheroid(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_length2d_spheroid(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Length2DSpheroid($1,$2);$_$;


ALTER FUNCTION public.st_length2d_spheroid(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 1097 (class 1255 OID 19618)
-- Name: st_length3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_length3d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_length_linestring';


ALTER FUNCTION public.st_length3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1066 (class 1255 OID 19591)
-- Name: st_length_spheroid(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_length_spheroid(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LengthSpheroid($1,$2);$_$;


ALTER FUNCTION public.st_length_spheroid(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 1098 (class 1255 OID 19619)
-- Name: st_length_spheroid3d(public.geometry, public.spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_length_spheroid3d(public.geometry, public.spheroid) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION public.st_length_spheroid3d(public.geometry, public.spheroid) OWNER TO postgres;

--
-- TOC entry 1067 (class 1255 OID 19601)
-- Name: st_line_interpolate_point(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_line_interpolate_point(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LineInterpolatePoint($1, $2);$_$;


ALTER FUNCTION public.st_line_interpolate_point(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 1319 (class 1255 OID 19603)
-- Name: st_line_locate_point(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_line_locate_point(geom1 public.geometry, geom2 public.geometry) RETURNS double precision
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LineLocatePoint($1, $2);$_$;


ALTER FUNCTION public.st_line_locate_point(geom1 public.geometry, geom2 public.geometry) OWNER TO postgres;

--
-- TOC entry 1068 (class 1255 OID 19602)
-- Name: st_line_substring(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_line_substring(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LineSubstring($1, $2, $3);$_$;


ALTER FUNCTION public.st_line_substring(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1069 (class 1255 OID 19605)
-- Name: st_locate_along_measure(public.geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_locate_along_measure(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LocateBetween($1, $2, $2);$_$;


ALTER FUNCTION public.st_locate_along_measure(public.geometry, double precision) OWNER TO postgres;

--
-- TOC entry 1070 (class 1255 OID 19604)
-- Name: st_locate_between_measures(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_locate_between_measures(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_LocateBetween($1, $2, $3);$_$;


ALTER FUNCTION public.st_locate_between_measures(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1099 (class 1255 OID 19621)
-- Name: st_makebox3d(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_makebox3d(public.geometry, public.geometry) RETURNS public.box3d
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_construct';


ALTER FUNCTION public.st_makebox3d(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1054 (class 1255 OID 19566)
-- Name: st_makeline_garray(public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_makeline_garray(public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_makeline_garray';


ALTER FUNCTION public.st_makeline_garray(public.geometry[]) OWNER TO postgres;

--
-- TOC entry 1071 (class 1255 OID 19589)
-- Name: st_mem_size(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_mem_size(public.geometry) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_MemSize($1);$_$;


ALTER FUNCTION public.st_mem_size(public.geometry) OWNER TO postgres;

--
-- TOC entry 1100 (class 1255 OID 19620)
-- Name: st_perimeter3d(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_perimeter3d(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_perimeter_poly';


ALTER FUNCTION public.st_perimeter3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 1329 (class 1255 OID 19594)
-- Name: st_point_inside_circle(public.geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_point_inside_circle(public.geometry, double precision, double precision, double precision) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_PointInsideCircle($1,$2,$3,$4);$_$;


ALTER FUNCTION public.st_point_inside_circle(public.geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1101 (class 1255 OID 19612)
-- Name: st_polygonize_garray(public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_polygonize_garray(public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-3', 'polygonize_garray';


ALTER FUNCTION public.st_polygonize_garray(public.geometry[]) OWNER TO postgres;

--
-- TOC entry 1072 (class 1255 OID 19584)
-- Name: st_shift_longitude(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_shift_longitude(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_ShiftLongitude($1);$_$;


ALTER FUNCTION public.st_shift_longitude(public.geometry) OWNER TO postgres;

--
-- TOC entry 1338 (class 1255 OID 19374)
-- Name: st_text(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_text(public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_to_text';


ALTER FUNCTION public.st_text(public.geometry) OWNER TO postgres;

--
-- TOC entry 1102 (class 1255 OID 19613)
-- Name: st_unite_garray(public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.st_unite_garray(public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'pgis_union_geometry_array';


ALTER FUNCTION public.st_unite_garray(public.geometry[]) OWNER TO postgres;

--
-- TOC entry 1342 (class 1255 OID 19567)
-- Name: startpoint(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.startpoint(public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_startpoint_linestring';


ALTER FUNCTION public.startpoint(public.geometry) OWNER TO postgres;

--
-- TOC entry 1108 (class 1255 OID 50406)
-- Name: subsurface_oil_condition_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.subsurface_oil_condition_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('Pit',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM subsurface_oil_condition
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'Pit01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.subsurface_oil_condition_code_update() OWNER TO postgres;

--
-- TOC entry 1073 (class 1255 OID 19570)
-- Name: summary(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.summary(public.geometry) RETURNS text
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_summary';


ALTER FUNCTION public.summary(public.geometry) OWNER TO postgres;

--
-- TOC entry 1109 (class 1255 OID 50407)
-- Name: surface_oil_condition_code_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.surface_oil_condition_code_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    next_code TEXT;
BEGIN
    -- get the next order number
   SELECT INTO next_code CONCAT('Z',
        TO_CHAR(COALESCE(CAST(RIGHT(MAX(code), 2) AS INT), 0) + 1, 'fm00'))
    FROM surface_oil_condition
    WHERE report=new.report
    GROUP BY report;
    -- update the field
    NEW.code = COALESCE(next_code,'Z01');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.surface_oil_condition_code_update() OWNER TO postgres;

--
-- TOC entry 1055 (class 1255 OID 19568)
-- Name: symdifference(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.symdifference(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_SymDifference';


ALTER FUNCTION public.symdifference(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1056 (class 1255 OID 19569)
-- Name: symmetricdifference(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.symmetricdifference(public.geometry, public.geometry) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'ST_SymDifference';


ALTER FUNCTION public.symmetricdifference(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1074 (class 1255 OID 19572)
-- Name: touches(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.touches(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'touches';


ALTER FUNCTION public.touches(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1075 (class 1255 OID 19571)
-- Name: transform(public.geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.transform(public.geometry, integer) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'transform';


ALTER FUNCTION public.transform(public.geometry, integer) OWNER TO postgres;

--
-- TOC entry 929 (class 1255 OID 19400)
-- Name: translate(public.geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.translate(public.geometry, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_translate($1, $2, $3, 0)$_$;


ALTER FUNCTION public.translate(public.geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 930 (class 1255 OID 19399)
-- Name: translate(public.geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.translate(public.geometry, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


ALTER FUNCTION public.translate(public.geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1343 (class 1255 OID 19401)
-- Name: transscale(public.geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.transscale(public.geometry, double precision, double precision, double precision, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT st_affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


ALTER FUNCTION public.transscale(public.geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 1103 (class 1255 OID 19614)
-- Name: unite_garray(public.geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.unite_garray(public.geometry[]) RETURNS public.geometry
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'pgis_union_geometry_array';


ALTER FUNCTION public.unite_garray(public.geometry[]) OWNER TO postgres;

--
-- TOC entry 1345 (class 1255 OID 19573)
-- Name: within(public.geometry, public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.within(public.geometry, public.geometry) RETURNS boolean
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$SELECT ST_Within($1, $2)$_$;


ALTER FUNCTION public.within(public.geometry, public.geometry) OWNER TO postgres;

--
-- TOC entry 1076 (class 1255 OID 19574)
-- Name: x(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.x(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_x_point';


ALTER FUNCTION public.x(public.geometry) OWNER TO postgres;

--
-- TOC entry 1077 (class 1255 OID 19575)
-- Name: xmax(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.xmax(public.box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_xmax';


ALTER FUNCTION public.xmax(public.box3d) OWNER TO postgres;

--
-- TOC entry 1078 (class 1255 OID 19576)
-- Name: xmin(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.xmin(public.box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_xmin';


ALTER FUNCTION public.xmin(public.box3d) OWNER TO postgres;

--
-- TOC entry 1079 (class 1255 OID 19577)
-- Name: y(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.y(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_y_point';


ALTER FUNCTION public.y(public.geometry) OWNER TO postgres;

--
-- TOC entry 1346 (class 1255 OID 19578)
-- Name: ymax(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ymax(public.box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_ymax';


ALTER FUNCTION public.ymax(public.box3d) OWNER TO postgres;

--
-- TOC entry 1080 (class 1255 OID 19579)
-- Name: ymin(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ymin(public.box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_ymin';


ALTER FUNCTION public.ymin(public.box3d) OWNER TO postgres;

--
-- TOC entry 1081 (class 1255 OID 19580)
-- Name: z(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.z(public.geometry) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_z_point';


ALTER FUNCTION public.z(public.geometry) OWNER TO postgres;

--
-- TOC entry 1082 (class 1255 OID 19581)
-- Name: zmax(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.zmax(public.box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_zmax';


ALTER FUNCTION public.zmax(public.box3d) OWNER TO postgres;

--
-- TOC entry 1347 (class 1255 OID 19583)
-- Name: zmflag(public.geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.zmflag(public.geometry) RETURNS smallint
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'LWGEOM_zmflag';


ALTER FUNCTION public.zmflag(public.geometry) OWNER TO postgres;

--
-- TOC entry 1083 (class 1255 OID 19582)
-- Name: zmin(public.box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.zmin(public.box3d) RETURNS double precision
    LANGUAGE c IMMUTABLE STRICT
    AS '$libdir/postgis-3', 'BOX3D_zmin';


ALTER FUNCTION public.zmin(public.box3d) OWNER TO postgres;

--
-- TOC entry 2232 (class 1255 OID 19442)
-- Name: extent(public.geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.extent(public.geometry) (
    SFUNC = public.st_combinebbox,
    STYPE = public.box3d,
    FINALFUNC = public.box2d
);


ALTER AGGREGATE public.extent(public.geometry) OWNER TO postgres;

--
-- TOC entry 2234 (class 1255 OID 19615)
-- Name: extent3d(public.geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.extent3d(public.geometry) (
    SFUNC = public.combine_bbox,
    STYPE = public.box3d
);


ALTER AGGREGATE public.extent3d(public.geometry) OWNER TO postgres;

--
-- TOC entry 2233 (class 1255 OID 19500)
-- Name: makeline(public.geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.makeline(public.geometry) (
    SFUNC = public.pgis_geometry_accum_transfn,
    STYPE = internal,
    FINALFUNC = public.pgis_geometry_makeline_finalfn
);


ALTER AGGREGATE public.makeline(public.geometry) OWNER TO postgres;

--
-- TOC entry 2235 (class 1255 OID 19616)
-- Name: memcollect(public.geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.memcollect(public.geometry) (
    SFUNC = public.st_collect,
    STYPE = public.geometry
);


ALTER AGGREGATE public.memcollect(public.geometry) OWNER TO postgres;

--
-- TOC entry 2236 (class 1255 OID 19617)
-- Name: memgeomunion(public.geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.memgeomunion(public.geometry) (
    SFUNC = public.geomunion,
    STYPE = public.geometry
);


ALTER AGGREGATE public.memgeomunion(public.geometry) OWNER TO postgres;

--
-- TOC entry 2237 (class 1255 OID 19622)
-- Name: st_extent3d(public.geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE public.st_extent3d(public.geometry) (
    SFUNC = public.st_combinebbox,
    STYPE = public.box3d
);


ALTER AGGREGATE public.st_extent3d(public.geometry) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 50408)
-- Name: asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    color character varying(255),
    datetime timestamp without time zone,
    description character varying(255),
    marker character varying(255),
    name character varying(255) NOT NULL,
    report character varying(255),
    episode character varying(255) NOT NULL
);


ALTER TABLE public.asset OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 50413)
-- Name: asset_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asset_item (
    id character varying(255) NOT NULL,
    geometry_type character varying(255),
    model character varying(255),
    name character varying(255) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.asset_item OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 50418)
-- Name: bookmark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookmark (
    id character varying(255) NOT NULL,
    createdtime timestamp without time zone NOT NULL,
    description character varying(255),
    pageurl character varying(255) NOT NULL,
    resource character varying(255) NOT NULL,
    resourceid character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    userlogin character varying(255)
);


ALTER TABLE public.bookmark OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 50423)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    comment character varying(4000) NOT NULL,
    report character varying(255),
    user_login character varying(255)
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 50428)
-- Name: configparams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configparams (
    id character varying(255) NOT NULL,
    bundle jsonb,
    createdtime timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL,
    topic character varying(255),
    value character varying(255) NOT NULL,
    userlogin character varying(255)
);


ALTER TABLE public.configparams OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 50433)
-- Name: episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode (
    id character varying(255) NOT NULL,
    tags character varying(255),
    affected_area public.geometry,
    begintime timestamp without time zone,
    description character varying(255),
    endtime timestamp without time zone,
    name character varying(255) NOT NULL,
    publish boolean,
    rating integer DEFAULT 0,
    status character varying(255),
    author character varying(255),
    public_user character varying(255)
);


ALTER TABLE public.episode OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 50439)
-- Name: episode_layer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode_layer (
    id character varying(255) NOT NULL,
    episode character varying(255) NOT NULL,
    layer character varying(255) NOT NULL
);


ALTER TABLE public.episode_layer OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 50444)
-- Name: episode_observer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode_observer (
    id character varying(255) NOT NULL,
    createdtime timestamp without time zone,
    episode character varying(255) NOT NULL,
    user_login character varying(255) NOT NULL,
    endtime timestamp without time zone,
    starttime timestamp without time zone
);


ALTER TABLE public.episode_observer OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 50449)
-- Name: episode_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode_user (
    id character varying(255) NOT NULL,
    episode character varying(255) NOT NULL,
    user_login character varying(255) NOT NULL
);


ALTER TABLE public.episode_user OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 50454)
-- Name: episode_user_layers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode_user_layers (
    episode_user character varying(255) NOT NULL,
    layers character varying(255) NOT NULL
);


ALTER TABLE public.episode_user_layers OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 50459)
-- Name: file_geometry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_geometry (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    comments character varying(255),
    orientation integer,
    title character varying(255) NOT NULL,
    report character varying(255),
    file character varying(255)
);


ALTER TABLE public.file_geometry OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 50464)
-- Name: file_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_record (
    id character varying(255) NOT NULL,
    file_name character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    resource character varying(255) NOT NULL,
    resource_id character varying(255) NOT NULL,
    upload_date timestamp without time zone NOT NULL,
    user_login character varying(255)
);


ALTER TABLE public.file_record OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 50469)
-- Name: gis_asset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gis_asset (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    color character varying(255),
    datetime timestamp without time zone,
    description character varying(255),
    marker character varying(255),
    name character varying(255) NOT NULL,
    status character varying(255),
    report character varying(255),
    gislayout character varying(255) NOT NULL,
    model character varying(255),
    owner character varying(255),
    visibility boolean
);


ALTER TABLE public.gis_asset OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 50474)
-- Name: gis_layout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gis_layout (
    id character varying(255) NOT NULL,
    createdtime timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255),
    episode character varying(255),
    createdby character varying(255)
);


ALTER TABLE public.gis_layout OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 50479)
-- Name: layer_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.layer_filter (
    dtype character varying(31) NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    lower_boundary character varying(255),
    property character varying(255),
    type character varying(255),
    upper_boundary character varying(255),
    value character varying(255),
    layer character varying(255)
);


ALTER TABLE public.layer_filter OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 50484)
-- Name: layer_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.layer_group (
    id character varying(255) NOT NULL,
    tags character varying(255),
    code character varying(255) NOT NULL,
    description character varying(255),
    enabled boolean,
    name character varying(255) NOT NULL,
    panel character varying(255)
);


ALTER TABLE public.layer_group OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 50489)
-- Name: layeracp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.layeracp (
    id character varying(255) NOT NULL,
    tags character varying(255),
    base_layer boolean,
    code character varying(255) NOT NULL,
    description character varying(255),
    enabled boolean,
    filter character varying(255),
    maxx double precision,
    maxy double precision,
    minx double precision,
    miny double precision,
    layer_class character varying(255),
    projection character varying(255),
    layer_type integer,
    level integer,
    name character varying(255) NOT NULL,
    params character varying(255),
    queryable boolean NOT NULL,
    srs character varying(255),
    style character varying(255),
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    layer_group character varying(255),
    secondaryurl character varying(500),
    downloadable boolean,
    downloadurl character varying(255),
    layer_name character varying(255),
    layer_title character varying(255),
    layer_metadata text
);


ALTER TABLE public.layeracp OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 50494)
-- Name: logbookrecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logbookrecord (
    id character varying(255) NOT NULL,
    tags character varying(255),
    createdtime timestamp without time zone,
    file_name character varying(255),
    file_path character varying(255),
    geometry public.geometry,
    message text,
    title character varying(255),
    createdby character varying(255),
    episode character varying(255),
    style character varying(255),
    type character varying(255)
);


ALTER TABLE public.logbookrecord OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 50499)
-- Name: measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurement (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    observedtime timestamp without time zone,
    quality real NOT NULL,
    report character varying(255),
    measurement_device character varying(255) NOT NULL
);


ALTER TABLE public.measurement OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 50504)
-- Name: measurement_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurement_device (
    id character varying(255) NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.measurement_device OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 50509)
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    comments character varying(255),
    title character varying(255) NOT NULL,
    report character varying(255)
);


ALTER TABLE public.note OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 50514)
-- Name: other_substance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.other_substance (
    id character varying(255) NOT NULL,
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    "character" character varying(255),
    thickness character varying(255),
    level character varying(255),
    cover_length double precision,
    cover_width double precision,
    substrate character varying(255),
    substratum_type character varying(255),
    zone_id character varying(255),
    report character varying(255),
    code character varying(255),
    distribution character varying(255),
    description character varying(500),
    subsurface boolean
);


ALTER TABLE public.other_substance OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 50519)
-- Name: panel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.panel (
    id character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.panel OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 50524)
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo (
    dtype character varying(31) NOT NULL,
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    comments character varying(255),
    file_name character varying(255),
    file_path character varying(255),
    report character varying(255),
    user_login character varying(255),
    episode character varying(255)
);


ALTER TABLE public.photo OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 50529)
-- Name: pollutant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pollutant (
    id character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.pollutant OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 50534)
-- Name: pollution_episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pollution_episode (
    id character varying(255) NOT NULL,
    tags character varying(255),
    affected_area public.geometry,
    begintime timestamp without time zone,
    description character varying(255),
    endtime timestamp without time zone,
    name character varying(255) NOT NULL,
    publish boolean,
    rating integer DEFAULT 0,
    status character varying(255),
    pollution_cause character varying(255),
    pollution_episode_type character varying(255),
    author character varying(255),
    public_user character varying(255)
);


ALTER TABLE public.pollution_episode OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 50540)
-- Name: pollution_episode_segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pollution_episode_segment (
    id character varying(255) NOT NULL,
    pollution_episode character varying(255) NOT NULL,
    segment character varying(255) NOT NULL
);


ALTER TABLE public.pollution_episode_segment OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 50545)
-- Name: pollution_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pollution_report (
    id character varying(255) NOT NULL,
    report_time timestamp without time zone NOT NULL,
    status character varying(255),
    author character varying(255) NOT NULL,
    caller_number character varying(255),
    caller_organization character varying(255),
    caller_transport_number character varying(255),
    caller_transport_type character varying(255),
    cloud_cover character varying(255),
    cloud_height character varying(255),
    observation_system character varying(255),
    observer_name character varying(255),
    observer_role character varying(255),
    sea_direction integer,
    sea_status character varying(255),
    visibility_status character varying(255),
    wind_direction integer,
    wind_speed integer,
    wind_speed_unit character varying(255),
    wind_status character varying(255),
    pollution_episode character varying(255),
    file_name character varying(255),
    file_path character varying(255)
);


ALTER TABLE public.pollution_report OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 50550)
-- Name: pollution_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pollution_source (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    observedtime timestamp without time zone,
    cause_description character varying(255),
    description character varying(255),
    name character varying(255),
    pollution_cause character varying(255),
    source_type character varying(255),
    report character varying(255)
);


ALTER TABLE public.pollution_source OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 50555)
-- Name: report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report (
    id character varying(255) NOT NULL,
    report_time timestamp without time zone NOT NULL,
    status character varying(255),
    author character varying(255) NOT NULL
);


ALTER TABLE public.report OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 50560)
-- Name: report_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_user (
    id character varying(255) NOT NULL,
    report character varying(255) NOT NULL,
    user_login character varying(255) NOT NULL
);


ALTER TABLE public.report_user OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 50565)
-- Name: scat_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report (
    id character varying(255) NOT NULL,
    report_time timestamp without time zone NOT NULL,
    status character varying(255),
    author character varying(255) NOT NULL,
    commune_region character varying(255),
    incident character varying(255),
    not_exists_subsurface_oil_conditions boolean,
    not_exists_surface_oil_conditions boolean,
    access_restrictions character varying(255),
    algae character varying(255),
    back_shore_cliff boolean,
    back_shore_cliff_height character varying(255),
    debris character varying(255),
    oiled_fauna character varying(255),
    ongoing_clean_up_activity boolean,
    suitable_laydown_area boolean,
    survey_end_time character varying(255),
    survey_start_time character varying(255),
    surveyed_from character varying(255),
    tide_height real,
    tide_type character varying(255),
    weather_info character varying(255),
    pollution_episode character varying(255),
    segment character varying(255),
    surveyed_segment character varying(255),
    ongoing_clean_up_activity_comments character varying(500),
    exist_debris boolean,
    oiled_debris boolean,
    number_debris integer,
    type_debris character varying(255),
    comments text
);


ALTER TABLE public.scat_report OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 50570)
-- Name: scat_report_algaes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_algaes (
    scat_report character varying(255) NOT NULL,
    number integer,
    oiled boolean,
    type character varying(255)
);


ALTER TABLE public.scat_report_algaes OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 50575)
-- Name: scat_report_conservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_conservation (
    scat_report character varying(255) NOT NULL,
    conservation character varying(255)
);


ALTER TABLE public.scat_report_conservation OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 50580)
-- Name: scat_report_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_contacts (
    scat_report character varying(255) NOT NULL,
    contact_name character varying(255),
    organisation character varying(255),
    phone_number character varying(255)
);


ALTER TABLE public.scat_report_contacts OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 50585)
-- Name: scat_report_debrises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_debrises (
    scat_report character varying(255) NOT NULL,
    number integer,
    oiled boolean,
    type character varying(255)
);


ALTER TABLE public.scat_report_debrises OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 50590)
-- Name: scat_report_direct_backshore_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_direct_backshore_access (
    scat_report character varying(255) NOT NULL,
    direct_backshore_access character varying(255)
);


ALTER TABLE public.scat_report_direct_backshore_access OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 50595)
-- Name: scat_report_local_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_local_features (
    scat_report character varying(255) NOT NULL,
    local_feature character varying(255),
    oiled boolean,
    primary_localfeature boolean
);


ALTER TABLE public.scat_report_local_features OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 50600)
-- Name: scat_report_neighbour_segment_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_neighbour_segment_access (
    scat_report character varying(255) NOT NULL,
    neighbour_segment_access character varying(255)
);


ALTER TABLE public.scat_report_neighbour_segment_access OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 50605)
-- Name: scat_report_oiled_faunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_oiled_faunas (
    scat_report character varying(255) NOT NULL,
    number integer,
    type character varying(255)
);


ALTER TABLE public.scat_report_oiled_faunas OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 50610)
-- Name: scat_report_shoreline_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_shoreline_types (
    scat_report character varying(255) NOT NULL,
    oiled boolean,
    primary_shoreline boolean,
    shoreline_type character varying(255)
);


ALTER TABLE public.scat_report_shoreline_types OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 50615)
-- Name: scat_report_uses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_report_uses (
    scat_report character varying(255) NOT NULL,
    uses character varying(255)
);


ALTER TABLE public.scat_report_uses OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 50620)
-- Name: scat_zone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scat_zone (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    latitude double precision NOT NULL,
    level character varying(255),
    longitude double precision NOT NULL,
    name character varying(255),
    substrate character varying(255),
    subsurface_oil boolean,
    surface_oil boolean,
    report character varying(255),
    scat_report character varying(255)
);


ALTER TABLE public.scat_zone OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 50625)
-- Name: segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.segment (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    coastline_type character varying(255),
    end_position public.geometry,
    length_surveyed real,
    max_intertidal_width real,
    segment_id character varying(255) NOT NULL,
    segment_length real,
    site_name character varying(255) NOT NULL,
    start_position public.geometry,
    wave_exposure character varying(255),
    report character varying(255)
);


ALTER TABLE public.segment OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 50630)
-- Name: spill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spill (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    observedtime timestamp without time zone,
    area double precision,
    course double precision,
    demora double precision,
    description character varying(255) NOT NULL,
    distance double precision,
    distance_unit character varying(255),
    height double precision,
    latitude double precision,
    longitude double precision,
    pollutant_origin character varying(255),
    speed double precision,
    speed_unit character varying(255),
    spill_aparience character varying(255),
    spill_aspect character varying(255),
    width double precision,
    report character varying(255),
    pollutant character varying(255),
    CONSTRAINT spill_area_check CHECK ((area >= (0)::double precision)),
    CONSTRAINT spill_course_check CHECK (((course >= (0)::double precision) AND (course <= (360)::double precision))),
    CONSTRAINT spill_distance_check CHECK ((distance >= (0)::double precision)),
    CONSTRAINT spill_height_check CHECK ((height >= (0)::double precision)),
    CONSTRAINT spill_speed_check CHECK (((speed >= (0)::double precision) AND (speed <= (200)::double precision))),
    CONSTRAINT spill_width_check CHECK ((width >= (0)::double precision))
);


ALTER TABLE public.spill OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 50641)
-- Name: spill_polrep; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.spill_polrep AS
 SELECT pollution_report.report_time,
    pollution_report.author,
    pollution_report.id AS polrep_id,
    spill.geometry,
    spill.description,
    spill.observedtime
   FROM (public.pollution_report
     JOIN public.spill ON (((pollution_report.id)::text = (spill.report)::text)));


ALTER TABLE public.spill_polrep OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 50646)
-- Name: subsurface_oil_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subsurface_oil_condition (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    oil_character character varying(255),
    oil_distribution character varying(255),
    oil_thickness character varying(255),
    buried_depth double precision,
    buried_thickness double precision,
    buried_water double precision,
    clean_below boolean,
    oil_penetration double precision,
    oiled_zone_end double precision,
    oiled_zone_start double precision,
    pit_depth double precision,
    pit_id character varying(255),
    sheen_colour character varying(255),
    water_table double precision,
    report character varying(255) NOT NULL,
    level character varying(255)
);


ALTER TABLE public.subsurface_oil_condition OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 50651)
-- Name: subsurface_oil_condition_sediment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subsurface_oil_condition_sediment_types (
    subsurface_oil_condition character varying(255) NOT NULL,
    sediment_types character varying(255)
);


ALTER TABLE public.subsurface_oil_condition_sediment_types OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 50656)
-- Name: surface_oil_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surface_oil_condition (
    id character varying(255) NOT NULL,
    code character varying(255),
    createdtime timestamp without time zone NOT NULL,
    geometry public.geometry,
    oil_character character varying(255),
    oil_distribution character varying(255),
    oil_thickness character varying(255),
    level character varying(255),
    oil_cover_length double precision,
    oil_cover_width double precision,
    substrate character varying(255),
    substratum_type character varying(255),
    zone_id character varying(255),
    report character varying(255) NOT NULL
);


ALTER TABLE public.surface_oil_condition OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 50661)
-- Name: user_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_login (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    user_details character varying(255),
    user_email character varying(255),
    user_name character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    user_role character varying(255) NOT NULL,
    activated boolean,
    activation_key character varying(20),
    created_date timestamp without time zone,
    expired_time timestamp without time zone,
    reset_date timestamp without time zone,
    reset_key character varying(20),
    full_name character varying(255),
    comments text,
    level integer DEFAULT 0,
    organization character varying(255),
    phone character varying(255)
);


ALTER TABLE public.user_login OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 50667)
-- Name: user_login_layer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_login_layer_groups (
    layer_groups character varying(255) NOT NULL,
    user_login character varying(255) NOT NULL
);


ALTER TABLE public.user_login_layer_groups OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 50672)
-- Name: userlogin_userauthorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userlogin_userauthorities (
    userlogin character varying(255) NOT NULL,
    name character varying(255)
);


ALTER TABLE public.userlogin_userauthorities OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 50677)
-- Name: userrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userrole (
    id character varying(255) NOT NULL,
    comments character varying(255),
    role character varying(255) NOT NULL
);


ALTER TABLE public.userrole OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 50682)
-- Name: userrole_authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userrole_authorities (
    userrole character varying(255) NOT NULL,
    name character varying(255)
);


ALTER TABLE public.userrole_authorities OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 50687)
-- Name: v_pictures_by_contingency; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_pictures_by_contingency AS
 SELECT photo.dtype,
    photo.id,
    photo.code,
    photo.createdtime,
    photo.geometry,
    photo.comments,
    photo.file_name,
    photo.file_path,
    photo.report,
    photo.user_login,
    photo.episode
   FROM public.photo
  WHERE ((photo.geometry)::text <> 'NULL'::text);


ALTER TABLE public.v_pictures_by_contingency OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 50691)
-- Name: v_polrep_by_episode; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_polrep_by_episode AS
 SELECT pollution_report.pollution_episode,
    pollution_report.report_time,
    user_login.full_name,
    pollution_report.id AS polrep_id,
    spill.geometry,
    spill.description,
    spill.observedtime
   FROM ((public.pollution_report
     JOIN public.spill ON (((pollution_report.id)::text = (spill.report)::text)))
     JOIN public.user_login ON (((pollution_report.author)::text = (user_login.id)::text)));


ALTER TABLE public.v_polrep_by_episode OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 50696)
-- Name: v_polrep_photo_episode; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_polrep_photo_episode AS
 SELECT photo.file_name,
    photo.createdtime,
    photo.geometry,
    photo.comments,
    photo.report,
    photo.code,
    pollution_episode.id AS id_episode
   FROM public.photo,
    public.pollution_report,
    public.pollution_episode
  WHERE (((photo.report)::text = (pollution_report.id)::text) AND ((pollution_report.pollution_episode)::text = (pollution_episode.id)::text));


ALTER TABLE public.v_polrep_photo_episode OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 50700)
-- Name: vcomment_episode; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vcomment_episode AS
 SELECT comment.createdtime,
    comment.geometry,
    comment.comment,
    comment.code,
    pollution_episode.id AS id_episode
   FROM public.comment,
    public.pollution_report,
    public.pollution_episode
  WHERE (((comment.report)::text = (pollution_report.id)::text) AND ((pollution_report.pollution_episode)::text = (pollution_episode.id)::text));


ALTER TABLE public.vcomment_episode OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 50704)
-- Name: vpollsource_episode; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vpollsource_episode AS
 SELECT pollution_source.id,
    pollution_source.createdtime,
    pollution_source.geometry,
    pollution_source.observedtime,
    pollution_source.cause_description,
    pollution_source.description,
    pollution_source.name,
    pollution_source.pollution_cause,
    pollution_source.source_type,
    pollution_source.report,
    pollution_source.code,
    pollution_episode.id AS id_episode
   FROM public.pollution_source,
    public.pollution_report,
    public.pollution_episode
  WHERE (((pollution_source.report)::text = (pollution_report.id)::text) AND ((pollution_report.pollution_episode)::text = (pollution_episode.id)::text));


ALTER TABLE public.vpollsource_episode OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 50709)
-- Name: vspill_episode; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vspill_episode AS
 SELECT spill.geometry,
    spill.createdtime,
    spill.observedtime,
    spill.description,
    spill.pollutant_origin,
    spill.spill_aparience,
    spill.spill_aspect,
    spill.area,
    spill.height,
    spill.width,
    spill.course,
    spill.demora,
    spill.code,
    pollution_episode.id AS id_episode
   FROM public.spill,
    public.pollution_report,
    public.pollution_episode
  WHERE (((spill.report)::text = (pollution_report.id)::text) AND ((pollution_report.pollution_episode)::text = (pollution_episode.id)::text));


ALTER TABLE public.vspill_episode OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 50714)
-- Name: vtag; Type: VIEW; Schema: public; Owner: coptool
--

CREATE VIEW public.vtag AS
 SELECT DISTINCT ('pollutionepisodes_'::text || s.tags) AS id,
    s.tags AS tag,
    'pollutionepisodes'::text AS resource
   FROM (public.pollution_episode t
     CROSS JOIN LATERAL unnest(string_to_array((t.tags)::text, ','::text)) s(tags))
UNION
 SELECT DISTINCT ('layers_'::text || s.tags) AS id,
    s.tags AS tag,
    'layers'::text AS resource
   FROM (public.layeracp t
     CROSS JOIN LATERAL unnest(string_to_array((t.tags)::text, ','::text)) s(tags))
UNION
 SELECT DISTINCT ('layergroups_'::text || s.tags) AS id,
    s.tags AS tag,
    'layergroups'::text AS resource
   FROM (public.layer_group t
     CROSS JOIN LATERAL unnest(string_to_array((t.tags)::text, ','::text)) s(tags))
UNION
 SELECT DISTINCT ('logbookrecords_'::text || s.tags) AS id,
    s.tags AS tag,
    'logbookrecords'::text AS resource
   FROM (public.logbookrecord t
     CROSS JOIN LATERAL unnest(string_to_array((t.tags)::text, ','::text)) s(tags));


ALTER TABLE public.vtag OWNER TO coptool;

--
-- TOC entry 5744 (class 0 OID 50408)
-- Dependencies: 224
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset (id, code, createdtime, geometry, color, datetime, description, marker, name, report, episode) FROM stdin;
\.


--
-- TOC entry 5745 (class 0 OID 50413)
-- Dependencies: 225
-- Data for Name: asset_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asset_item (id, geometry_type, model, name, owner) FROM stdin;
\.


--
-- TOC entry 5746 (class 0 OID 50418)
-- Dependencies: 226
-- Data for Name: bookmark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookmark (id, createdtime, description, pageurl, resource, resourceid, title, userlogin) FROM stdin;
\.


--
-- TOC entry 5747 (class 0 OID 50423)
-- Dependencies: 227
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, code, createdtime, geometry, comment, report, user_login) FROM stdin;
\.


--
-- TOC entry 5748 (class 0 OID 50428)
-- Dependencies: 228
-- Data for Name: configparams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configparams (id, bundle, createdtime, description, name, topic, value, userlogin) FROM stdin;
31	{"en": "Translucent", "es": "Apenas visible en excelentes condiciones de luz ", "gl": "Apenas visible en excelentes condicións de luz"}	2022-04-25 00:00:00		app.spill.spillaspect.translucent	app.spill.spillaspect	translucent	1
32	{"en": "Film platted", "es": "Visible como una película prateada sobre a auga", "gl": "Visible coma unha película prateada sobre a auga"}	2022-04-25 00:00:00		app.spill.spillaspect.filmplatted	app.spill.spillaspect	filmplatted	1
33	{"en": "Dark traces", "es": "Trazas de color más oscuro", "gl": "Trazas de cor máis escuro"}	2022-04-25 00:00:00		app.spill.spillaspect.darktraces	app.spill.spillaspect	darktraces	1
34	{"en": "Light bands", "es": "Bandas brillantes de color naranja, azul o verde  ", "gl": "Bandas brillantes de cor laranxa, azul ou verde "}	2022-04-25 00:00:00		app.spill.spillaspect.lightbands	app.spill.spillaspect	lightbands	1
35	{"en": "Color bands", "es": "Bandas más oscuras de los colores mencionados", "gl": "Bandas mais escuras das mencionadas cores"}	2022-04-25 00:00:00		app.spill.spillaspect.colorbands	app.spill.spillaspect	colorbands	1
36	{"en": "Dark bands", "es": "Color muy oscuro", "gl": "Cor moi escuro"}	2022-04-25 00:00:00		app.spill.spillaspect.darkbands	app.spill.spillaspect	darkbands	1
37	{"en": "Crued oil", "es": "Petróleo crudo", "gl": "Petróleo cru"}	2022-04-25 00:00:00		app.spill.pollutantorigin.crudeoil	app.spill.pollutantorigin	crudeoil	1
38	{"en": "Fuel", "es": "Combustible/Aceite", "gl": "Combustible/Aceite"}	2022-04-25 00:00:00		app.spill.pollutantorigin.fuel	app.spill.pollutantorigin	fuel	1
39	{"en": "Chemicals", "es": "Productos químicos", "gl": "Productos químicos"}	2022-04-25 00:00:00		app.spill.pollutantorigin.chemicals	app.spill.pollutantorigin	chemicals	1
40	{"en": "Solid", "es": "Residuos sólidos", "gl": "Residuos sólidos"}	2022-04-25 00:00:00		app.spill.pollutantorigin.solid	app.spill.pollutantorigin	solid	1
41	{"en": "Organic", "es": "Materia orgánica", "gl": "Materia orgánica"}	2022-04-25 00:00:00		app.spill.pollutantorigin.organic	app.spill.pollutantorigin	organic	1
42	{"en": "Unknown", "es": "Desconocida", "gl": "Descoñecida"}	2022-04-25 00:00:00		app.spill.pollutantorigin.unknown	app.spill.pollutantorigin	unknown	1
43	{"en": "Continuous", "es": "Superficie continua", "gl": "Superficie continua"}	2022-04-25 00:00:00		app.spill.spillaparience.continuous	app.spill.spillaparience	continuous	1
44	{"en": "Band", "es": "Bandas longitudinales", "gl": "Bandas lonxitudinais"}	2022-04-25 00:00:00		app.spill.spillaparience.band	app.spill.spillaparience	band	1
45	{"en": "Patches", "es": "Parches aislados", "gl": "Parches illados"}	2022-04-25 00:00:00		app.spill.spillaparience.patches	app.spill.spillaparience	patches	1
1	{"en": "Boat", "es": "Embarcación", "gl": "Embarcación"}	2022-03-16 00:00:00		app.callertransporttype.boat	app.callertransporttype	boat	1
2	{"en": "Plain", "es": "Aeronave", "gl": "Aeronave"}	2022-03-16 00:00:00		app.callertransporttype.plain	app.callertransporttype	plain	1
3	{"en": "Visual", "es": "Visual", "gl": "Visual"}	2022-03-16 00:00:00		app.observationsystem.visual	app.observationsystem	visual	1
4	{"en": "Teledetection", "es": "Teledetección", "gl": "Teledección"}	2022-03-16 00:00:00		app.observationsystem.teledetection	app.observationsystem	teledetection	1
5	{"en": "Termographic", "es": "Termográfica", "gl": "Termográfica"}	2022-03-16 00:00:00		app.observationsystem.termographic	app.observationsystem	termographic	1
9	{"en": "On foot", "es": "A pie", "gl": "A pé"}	2022-04-07 00:00:00		app.callertransporttype.food	app.callertransporttype	food	1
10	{"en": "Vehicle", "es": "Vehículo", "gl": "Vehículo"}	2022-04-07 00:00:00		app.callertransporttype.vehicle	app.callertransporttype	vehicle	1
11	{"en": "knots", "es": "nudos", "gl": "nós"}	2022-04-07 00:00:00		app.windspeedunit.knots	app.windspeedunit	knots	1
12	{"en": "m/s", "es": "m/s", "gl": "m/s"}	2022-04-07 00:00:00		app.windspeedunit.m/s	app.windspeedunit	m/s	1
13	{"en": "km/h", "es": "km/h", "gl": "km/h"}	2022-04-07 00:00:00		app.windspeedunit.km/h	app.windspeedunit	km/h	1
20	{"en": "Low", "es": "Bajo", "gl": "Baixo"}	2022-04-07 00:00:00		app.cloudheight.low	app.cloudheight	low	1
21	{"en": "Medium", "es": "Medio", "gl": "Medio"}	2022-04-07 00:00:00		app.cloudheight.medium	app.cloudheight	medium	1
22	{"en": "High", "es": "Alto", "gl": "Alto"}	2022-04-07 00:00:00		app.cloudheight.high	app.cloudheight	high	1
23	{"en": "Rizado", "es": "Rizado", "gl": "Rizado"}	2022-04-07 00:00:00		app.seastatus.rizado	app.seastatus	rizado	1
24	{"en": "Ovellado", "es": "Marejadilla", "gl": "Ovellado"}	2022-04-07 00:00:00		app.seastatus.ovellado	app.seastatus	ovellado	1
25	{"en": "Marusia", "es": "Marejada", "gl": "Marusia"}	2022-04-07 00:00:00		app.seastatus.marusia	app.seastatus	marusia	1
26	{"en": "Forte marusia", "es": "Fuerte marejada", "gl": "Forte marusia"}	2022-04-07 00:00:00		app.seastatus.fortemarusia	app.seastatus	fortemarusia	1
27	{"en": "Meidavaga", "es": "Gruesa", "gl": "Meidavaga"}	2022-04-07 00:00:00		app.seastatus.mediavaga	app.seastatus	mediavaga	1
28	{"en": "Vaga", "es": "Muy Gruesa", "gl": "Vaga"}	2022-04-07 00:00:00		app.seastatus.vaga	app.seastatus	vaga	1
29	{"en": "Vagallon", "es": "Arbolada", "gl": "Vagallon"}	2022-04-07 00:00:00		app.seastatus.vagallon	app.seastatus	vagallon	1
30	{"en": "Vagallon campal", "es": "Montañosa", "gl": "Vagallon campal"}	2022-04-07 00:00:00		app.seastatus.vagalloncampal	app.seastatus	vagalloncampal	1
14	{"en": "Excellent", "es": "Excelente", "gl": "Excelente"}	2022-04-07 00:00:00		app.visibilitystatus.excelente	app.visibilitystatus	excelente	1
15	{"en": "Very Good", "es": "Muy buena", "gl": "Moi boa"}	2022-04-07 00:00:00		app.visibilitystatus.moiboa	app.visibilitystatus	moiboa	1
16	{"en": "Good", "es": "Buena", "gl": "Boa"}	2022-04-07 00:00:00		app.visibilitystatus.boa	app.visibilitystatus	boa	1
17	{"en": "Midle", "es": "Regular", "gl": "Regular"}	2022-04-07 00:00:00		app.visibilitystatus.regular	app.visibilitystatus	regular	1
18	{"en": "Bad", "es": "Mala", "gl": "Mala"}	2022-04-07 00:00:00		app.visibilitystatus.mala	app.visibilitystatus	mala	1
19	{"en": "None", "es": "Nula", "gl": "Nula"}	2022-04-07 00:00:00		app.visibilitystatus.nula	app.visibilitystatus	nula	1
100	{"en": "Boat", "es": "Embarcación", "gl": "Embarcación"}	2022-03-16 00:00:00		app.pollutionreport.callertransporttype.boat	app.pollutionreport.callertransporttype	boat	1
7	{"en": "Alarm", "es": "Alarma", "gl": "Alarma"}	2022-03-16 00:00:00		app.logbookrecord.tag.tag2	app.logbookrecord.tag	alarm	1
101	{"en": "Plain", "es": "Aeronave", "gl": "Aeronave"}	2022-03-16 00:00:00		app.pollutionreport.callertransporttype.plain	app.pollutionreport.callertransporttype	plain	1
102	{"en": "Visual", "es": "Visual", "gl": "Visual"}	2022-03-16 00:00:00		app.pollutionreport.observationsystem.visual	app.pollutionreport.observationsystem	visual	1
103	{"en": "Teledetection", "es": "Teledetección", "gl": "Teledección"}	2022-03-16 00:00:00		app.pollutionreport.observationsystem.teledetection	app.pollutionreport.observationsystem	teledetection	1
104	{"en": "Termographic", "es": "Termográfica", "gl": "Termográfica"}	2022-03-16 00:00:00		app.pollutionreport.observationsystem.termographic	app.pollutionreport.observationsystem	termographic	1
105	{"en": "Tag 1", "es": "Etiqueta 1", "gl": "Etiqueta 1"}	2022-03-16 00:00:00		app.pollutionreport.logbookrecord.tag.tag1	app.pollutionreport.logbookrecord.tag	tag1	1
106	{"en": "Tag 2", "es": "Etiqueta 2", "gl": "Etiqueta 2"}	2022-03-16 00:00:00		app.pollutionreport.logbookrecord.tag.tag2	app.pollutionreport.logbookrecord.tag	tag2	1
107	{"en": "Tag 3", "es": "Etiqueta 3", "gl": "Etiqueta 3"}	2022-03-16 00:00:00		app.pollutionreport.logbookrecord.tag.tag3	app.pollutionreport.logbookrecord.tag	tag3	1
108	{"en": "On foot", "es": "A pie", "gl": "A pé"}	2022-04-07 00:00:00		app.pollutionreport.callertransporttype.food	app.pollutionreport.callertransporttype	food	1
109	{"en": "Vehicle", "es": "Vehículo", "gl": "Vehículo"}	2022-04-07 00:00:00		app.pollutionreport.callertransporttype.vehicle	app.pollutionreport.callertransporttype	vehicle	1
110	{"en": "knots", "es": "nudos", "gl": "nós"}	2022-04-07 00:00:00		app.pollutionreport.windspeedunit.knots	app.pollutionreport.windspeedunit	knots	1
111	{"en": "m/s", "es": "m/s", "gl": "m/s"}	2022-04-07 00:00:00		app.pollutionreport.windspeedunit.m/s	app.pollutionreport.windspeedunit	m/s	1
112	{"en": "km/h", "es": "km/h", "gl": "km/h"}	2022-04-07 00:00:00		app.pollutionreport.windspeedunit.km/h	app.pollutionreport.windspeedunit	km/h	1
113	{"en": "Excellent", "es": "Excelente", "gl": "Excelente"}	2022-04-07 00:00:00		app.pollutionreport.visibilitystatus.excelente	app.pollutionreport.visibilitystatus	excelente	1
114	{"en": "Very Good", "es": "Muy buena", "gl": "Moi boa"}	2022-04-07 00:00:00		app.pollutionreport.visibilitystatus.moiboa	app.pollutionreport.visibilitystatus	moiboa	1
115	{"en": "Good", "es": "Buena", "gl": "Boa"}	2022-04-07 00:00:00		app.pollutionreport.visibilitystatus.boa	app.pollutionreport.visibilitystatus	boa	1
116	{"en": "Midle", "es": "Regular", "gl": "Regular"}	2022-04-07 00:00:00		app.pollutionreport.visibilitystatus.regular	app.pollutionreport.visibilitystatus	regular	1
117	{"en": "Bad", "es": "Mala", "gl": "Mala"}	2022-04-07 00:00:00		app.pollutionreport.visibilitystatus.mala	app.pollutionreport.visibilitystatus	mala	1
118	{"en": "None", "es": "Nula", "gl": "Nula"}	2022-04-07 00:00:00		app.pollutionreport.visibilitystatus.nula	app.pollutionreport.visibilitystatus	nula	1
119	{"en": "Low", "es": "Bajo", "gl": "Baixo"}	2022-04-07 00:00:00		app.pollutionreport.cloudheight.low	app.pollutionreport.cloudheight	low	1
120	{"en": "Medium", "es": "Medio", "gl": "Medio"}	2022-04-07 00:00:00		app.pollutionreport.cloudheight.medium	app.pollutionreport.cloudheight	medium	1
121	{"en": "High", "es": "Alto", "gl": "Alto"}	2022-04-07 00:00:00		app.pollutionreport.cloudheight.high	app.pollutionreport.cloudheight	high	1
122	{"en": "Rizado", "es": "Rizado", "gl": "Rizado"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.rizado	app.pollutionreport.seastatus	rizado	1
123	{"en": "Ovellado", "es": "Marejadilla", "gl": "Ovellado"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.ovellado	app.pollutionreport.seastatus	ovellado	1
124	{"en": "Marusia", "es": "Marejada", "gl": "Marusia"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.marusia	app.pollutionreport.seastatus	marusia	1
125	{"en": "Forte marusia", "es": "Fuerte marejada", "gl": "Forte marusia"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.fortemarusia	app.pollutionreport.seastatus	fortemarusia	1
126	{"en": "Meidavaga", "es": "Gruesa", "gl": "Meidavaga"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.mediavaga	app.pollutionreport.seastatus	mediavaga	1
127	{"en": "Vaga", "es": "Muy Gruesa", "gl": "Vaga"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.vaga	app.pollutionreport.seastatus	vaga	1
128	{"en": "Vagallon", "es": "Arbolada", "gl": "Vagallon"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.vagallon	app.pollutionreport.seastatus	vagallon	1
129	{"en": "Vagallon campal", "es": "Montañosa", "gl": "Vagallon campal"}	2022-04-07 00:00:00		app.pollutionreport.seastatus.vagalloncampal	app.pollutionreport.seastatus	vagalloncampal	1
148	{"en": "Collision", "es": "Colisión", "gl": "Colisión"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.collision	app.pollutionsource.pollutioncause	collision	1
149	{"en": "Sink", "es": "Naufragio", "gl": "Naufraxio"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.sink	app.pollutionsource.pollutioncause	sink	1
151	{"en": "Run aground", "es": "Embarrancada", "gl": "Embarrancada"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.runaground	app.pollutionsource.pollutioncause	runaground	1
152	{"en": "Leak", "es": "Derrame operativo", "gl": "Derrame operativo"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.leak	app.pollutionsource.pollutioncause	leak	1
153	{"en": "Load fuel", "es": "Toma de combustible", "gl": "Toma de combustible"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.loadfuel	app.pollutionsource.pollutioncause	loadfuel	1
154	{"en": "Unknown", "es": "Desconocido", "gl": "Descoñecido"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.unknown	app.pollutionsource.pollutioncause	unknown	1
155	{"en": "Others", "es": "Otros", "gl": "Outros"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.others	app.pollutionsource.pollutioncause	others	1
145	{"en": "Ship", "es": "Barco", "gl": "Barco"}	2022-04-25 00:00:00		app.pollutionsource.sourcetype.ship	app.pollutionsource.sourcetype	ship	1
146	{"en": "Land", "es": "Tierra", "gl": "Terra"}	2022-04-25 00:00:00		app.pollutionsource.sourcetype.land	app.pollutionsource.sourcetype	land	1
147	{"en": "Unknown", "es": "Desconocido", "gl": "Descoñecido"}	2022-04-25 00:00:00		app.pollutionsource.sourcetype.unknown	app.pollutionsource.sourcetype	unknown	1
150	{"en": "Burst", "es": "Explosión", "gl": "Explosión"}	2022-04-25 00:00:00		app.pollutionsource.pollutioncause.explosion	app.pollutionsource.pollutioncause	explosion	1
156	{}	2022-11-25 00:00:00		alarm	app.logbookrecord.style	color:red	1
158	{}	2022-11-28 00:00:00		general	app.logbookrecord.style	color:grey	1
157	{}	2022-11-25 00:00:00		notice	app.logbookrecord.style	color:orange	1
6	{"en": "Notice", "es": "Aviso", "gl": "Aviso"}	2022-03-16 00:00:00		app.logbookrecord.tag.tag1	app.logbookrecord.tag	notice	1
8	{"en": "General", "es": "General", "gl": "General"}	2022-03-16 00:00:00		app.logbookrecord.tag.tag3	app.logbookrecord.tag	general	1
\.


--
-- TOC entry 5749 (class 0 OID 50433)
-- Dependencies: 229
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode (id, tags, affected_area, begintime, description, endtime, name, publish, rating, status, author, public_user) FROM stdin;
\.


--
-- TOC entry 5750 (class 0 OID 50439)
-- Dependencies: 230
-- Data for Name: episode_layer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode_layer (id, episode, layer) FROM stdin;
\.


--
-- TOC entry 5751 (class 0 OID 50444)
-- Dependencies: 231
-- Data for Name: episode_observer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode_observer (id, createdtime, episode, user_login, endtime, starttime) FROM stdin;
\.


--
-- TOC entry 5752 (class 0 OID 50449)
-- Dependencies: 232
-- Data for Name: episode_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode_user (id, episode, user_login) FROM stdin;
\.


--
-- TOC entry 5753 (class 0 OID 50454)
-- Dependencies: 233
-- Data for Name: episode_user_layers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode_user_layers (episode_user, layers) FROM stdin;
\.


--
-- TOC entry 5754 (class 0 OID 50459)
-- Dependencies: 234
-- Data for Name: file_geometry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.file_geometry (id, code, createdtime, geometry, comments, orientation, title, report, file) FROM stdin;
\.


--
-- TOC entry 5755 (class 0 OID 50464)
-- Dependencies: 235
-- Data for Name: file_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.file_record (id, file_name, file_path, resource, resource_id, upload_date, user_login) FROM stdin;
\.


--
-- TOC entry 5756 (class 0 OID 50469)
-- Dependencies: 236
-- Data for Name: gis_asset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gis_asset (id, code, createdtime, geometry, color, datetime, description, marker, name, status, report, gislayout, model, owner, visibility) FROM stdin;
\.


--
-- TOC entry 5757 (class 0 OID 50474)
-- Dependencies: 237
-- Data for Name: gis_layout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gis_layout (id, createdtime, description, name, episode, createdby) FROM stdin;
\.


--
-- TOC entry 5758 (class 0 OID 50479)
-- Dependencies: 238
-- Data for Name: layer_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.layer_filter (dtype, id, name, lower_boundary, property, type, upper_boundary, value, layer) FROM stdin;
\.


--
-- TOC entry 5759 (class 0 OID 50484)
-- Dependencies: 239
-- Data for Name: layer_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.layer_group (id, tags, code, description, enabled, name, panel) FROM stdin;
\.


--
-- TOC entry 5760 (class 0 OID 50489)
-- Dependencies: 240
-- Data for Name: layeracp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.layeracp (id, tags, base_layer, code, description, enabled, filter, maxx, maxy, minx, miny, layer_class, projection, layer_type, level, name, params, queryable, srs, style, title, url, layer_group, secondaryurl, downloadable, downloadurl, layer_name, layer_title, layer_metadata) FROM stdin;
\.


--
-- TOC entry 5761 (class 0 OID 50494)
-- Dependencies: 241
-- Data for Name: logbookrecord; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logbookrecord (id, tags, createdtime, file_name, file_path, geometry, message, title, createdby, episode, style, type) FROM stdin;
\.


--
-- TOC entry 5762 (class 0 OID 50499)
-- Dependencies: 242
-- Data for Name: measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurement (id, code, createdtime, geometry, observedtime, quality, report, measurement_device) FROM stdin;
\.


--
-- TOC entry 5763 (class 0 OID 50504)
-- Dependencies: 243
-- Data for Name: measurement_device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurement_device (id, description, name) FROM stdin;
\.


--
-- TOC entry 5764 (class 0 OID 50509)
-- Dependencies: 244
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note (id, code, createdtime, geometry, comments, title, report) FROM stdin;
\.


--
-- TOC entry 5765 (class 0 OID 50514)
-- Dependencies: 245
-- Data for Name: other_substance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.other_substance (id, createdtime, geometry, "character", thickness, level, cover_length, cover_width, substrate, substratum_type, zone_id, report, code, distribution, description, subsurface) FROM stdin;
\.


--
-- TOC entry 5766 (class 0 OID 50519)
-- Dependencies: 246
-- Data for Name: panel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.panel (id, code, description, enabled, name, type) FROM stdin;
\.


--
-- TOC entry 5767 (class 0 OID 50524)
-- Dependencies: 247
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photo (dtype, id, code, createdtime, geometry, comments, file_name, file_path, report, user_login, episode) FROM stdin;
\.


--
-- TOC entry 5768 (class 0 OID 50529)
-- Dependencies: 248
-- Data for Name: pollutant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pollutant (id, description, name) FROM stdin;
\.


--
-- TOC entry 5769 (class 0 OID 50534)
-- Dependencies: 249
-- Data for Name: pollution_episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pollution_episode (id, tags, affected_area, begintime, description, endtime, name, publish, rating, status, pollution_cause, pollution_episode_type, author, public_user) FROM stdin;
\.


--
-- TOC entry 5770 (class 0 OID 50540)
-- Dependencies: 250
-- Data for Name: pollution_episode_segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pollution_episode_segment (id, pollution_episode, segment) FROM stdin;
\.


--
-- TOC entry 5771 (class 0 OID 50545)
-- Dependencies: 251
-- Data for Name: pollution_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pollution_report (id, report_time, status, author, caller_number, caller_organization, caller_transport_number, caller_transport_type, cloud_cover, cloud_height, observation_system, observer_name, observer_role, sea_direction, sea_status, visibility_status, wind_direction, wind_speed, wind_speed_unit, wind_status, pollution_episode, file_name, file_path) FROM stdin;
\.


--
-- TOC entry 5772 (class 0 OID 50550)
-- Dependencies: 252
-- Data for Name: pollution_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pollution_source (id, code, createdtime, geometry, observedtime, cause_description, description, name, pollution_cause, source_type, report) FROM stdin;
\.


--
-- TOC entry 5773 (class 0 OID 50555)
-- Dependencies: 253
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report (id, report_time, status, author) FROM stdin;
\.


--
-- TOC entry 5774 (class 0 OID 50560)
-- Dependencies: 254
-- Data for Name: report_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_user (id, report, user_login) FROM stdin;
\.


--
-- TOC entry 5775 (class 0 OID 50565)
-- Dependencies: 255
-- Data for Name: scat_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report (id, report_time, status, author, commune_region, incident, not_exists_subsurface_oil_conditions, not_exists_surface_oil_conditions, access_restrictions, algae, back_shore_cliff, back_shore_cliff_height, debris, oiled_fauna, ongoing_clean_up_activity, suitable_laydown_area, survey_end_time, survey_start_time, surveyed_from, tide_height, tide_type, weather_info, pollution_episode, segment, surveyed_segment, ongoing_clean_up_activity_comments, exist_debris, oiled_debris, number_debris, type_debris, comments) FROM stdin;
\.


--
-- TOC entry 5776 (class 0 OID 50570)
-- Dependencies: 256
-- Data for Name: scat_report_algaes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_algaes (scat_report, number, oiled, type) FROM stdin;
\.


--
-- TOC entry 5777 (class 0 OID 50575)
-- Dependencies: 257
-- Data for Name: scat_report_conservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_conservation (scat_report, conservation) FROM stdin;
\.


--
-- TOC entry 5778 (class 0 OID 50580)
-- Dependencies: 258
-- Data for Name: scat_report_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_contacts (scat_report, contact_name, organisation, phone_number) FROM stdin;
\.


--
-- TOC entry 5779 (class 0 OID 50585)
-- Dependencies: 259
-- Data for Name: scat_report_debrises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_debrises (scat_report, number, oiled, type) FROM stdin;
\.


--
-- TOC entry 5780 (class 0 OID 50590)
-- Dependencies: 260
-- Data for Name: scat_report_direct_backshore_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_direct_backshore_access (scat_report, direct_backshore_access) FROM stdin;
\.


--
-- TOC entry 5781 (class 0 OID 50595)
-- Dependencies: 261
-- Data for Name: scat_report_local_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_local_features (scat_report, local_feature, oiled, primary_localfeature) FROM stdin;
\.


--
-- TOC entry 5782 (class 0 OID 50600)
-- Dependencies: 262
-- Data for Name: scat_report_neighbour_segment_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_neighbour_segment_access (scat_report, neighbour_segment_access) FROM stdin;
\.


--
-- TOC entry 5783 (class 0 OID 50605)
-- Dependencies: 263
-- Data for Name: scat_report_oiled_faunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_oiled_faunas (scat_report, number, type) FROM stdin;
\.


--
-- TOC entry 5784 (class 0 OID 50610)
-- Dependencies: 264
-- Data for Name: scat_report_shoreline_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_shoreline_types (scat_report, oiled, primary_shoreline, shoreline_type) FROM stdin;
\.


--
-- TOC entry 5785 (class 0 OID 50615)
-- Dependencies: 265
-- Data for Name: scat_report_uses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_report_uses (scat_report, uses) FROM stdin;
\.


--
-- TOC entry 5786 (class 0 OID 50620)
-- Dependencies: 266
-- Data for Name: scat_zone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scat_zone (id, code, createdtime, geometry, latitude, level, longitude, name, substrate, subsurface_oil, surface_oil, report, scat_report) FROM stdin;
\.


--
-- TOC entry 5787 (class 0 OID 50625)
-- Dependencies: 267
-- Data for Name: segment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.segment (id, code, createdtime, geometry, coastline_type, end_position, length_surveyed, max_intertidal_width, segment_id, segment_length, site_name, start_position, wave_exposure, report) FROM stdin;
8ae4809a80f0637d01810465eb730000	\N	2022-05-27 09:23:17.235	0102000000030000005317A9F1250222C05CB52BFF473C45405D17A9D9100222C07CC0FA79403C45401918A9D9E30122C00DDF2A37393C4540	\N	01010000001918A9D9E30122C00DDF2A37393C4540	\N	\N	1	\N	Praia do Pazo	01010000005317A9F1250222C05CB52BFF473C4540	\N	\N
8ae4809a81905c8d0181cdae96e70006	\N	2022-07-05 11:26:20.135	\N	\N	\N	\N	\N	25	\N	hhg	\N	\N	\N
\.


--
-- TOC entry 5415 (class 0 OID 18483)
-- Dependencies: 214
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5788 (class 0 OID 50630)
-- Dependencies: 268
-- Data for Name: spill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spill (id, code, createdtime, geometry, observedtime, area, course, demora, description, distance, distance_unit, height, latitude, longitude, pollutant_origin, speed, speed_unit, spill_aparience, spill_aspect, width, report, pollutant) FROM stdin;
\.


--
-- TOC entry 5789 (class 0 OID 50646)
-- Dependencies: 270
-- Data for Name: subsurface_oil_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subsurface_oil_condition (id, code, createdtime, geometry, oil_character, oil_distribution, oil_thickness, buried_depth, buried_thickness, buried_water, clean_below, oil_penetration, oiled_zone_end, oiled_zone_start, pit_depth, pit_id, sheen_colour, water_table, report, level) FROM stdin;
\.


--
-- TOC entry 5790 (class 0 OID 50651)
-- Dependencies: 271
-- Data for Name: subsurface_oil_condition_sediment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subsurface_oil_condition_sediment_types (subsurface_oil_condition, sediment_types) FROM stdin;
\.


--
-- TOC entry 5791 (class 0 OID 50656)
-- Dependencies: 272
-- Data for Name: surface_oil_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.surface_oil_condition (id, code, createdtime, geometry, oil_character, oil_distribution, oil_thickness, level, oil_cover_length, oil_cover_width, substrate, substratum_type, zone_id, report) FROM stdin;
\.


--
-- TOC entry 5792 (class 0 OID 50661)
-- Dependencies: 273
-- Data for Name: user_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_login (id, enabled, user_details, user_email, user_name, user_password, user_role, activated, activation_key, created_date, expired_time, reset_date, reset_key, full_name, comments, level, organization, phone) FROM stdin;
1	t	admin	admin@user.com	admin	manifests	ADMIN	t	\N	\N	\N	\N	\N	Default Admin User	\N	0	\N	\N
\.


--
-- TOC entry 5793 (class 0 OID 50667)
-- Dependencies: 274
-- Data for Name: user_login_layer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_login_layer_groups (layer_groups, user_login) FROM stdin;
\.


--
-- TOC entry 5794 (class 0 OID 50672)
-- Dependencies: 275
-- Data for Name: userlogin_userauthorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userlogin_userauthorities (userlogin, name) FROM stdin;
\.


--
-- TOC entry 5795 (class 0 OID 50677)
-- Dependencies: 276
-- Data for Name: userrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userrole (id, comments, role) FROM stdin;
ADMIN	\N	ADMIN
USER	\N	USER
\.


--
-- TOC entry 5796 (class 0 OID 50682)
-- Dependencies: 277
-- Data for Name: userrole_authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userrole_authorities (userrole, name) FROM stdin;
\.


--
-- TOC entry 5416 (class 0 OID 19193)
-- Dependencies: 219
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 5417 (class 0 OID 19205)
-- Dependencies: 220
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 5444 (class 2606 OID 50720)
-- Name: asset_item asset_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset_item
    ADD CONSTRAINT asset_item_pkey PRIMARY KEY (id);


--
-- TOC entry 5442 (class 2606 OID 50722)
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (id);


--
-- TOC entry 5446 (class 2606 OID 50724)
-- Name: bookmark bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT bookmark_pkey PRIMARY KEY (id);


--
-- TOC entry 5448 (class 2606 OID 50726)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 5450 (class 2606 OID 50728)
-- Name: configparams configparams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configparams
    ADD CONSTRAINT configparams_pkey PRIMARY KEY (id);


--
-- TOC entry 5455 (class 2606 OID 50730)
-- Name: episode_layer episode_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_layer
    ADD CONSTRAINT episode_layer_pkey PRIMARY KEY (id);


--
-- TOC entry 5457 (class 2606 OID 50732)
-- Name: episode_observer episode_observer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_observer
    ADD CONSTRAINT episode_observer_pkey PRIMARY KEY (id);


--
-- TOC entry 5453 (class 2606 OID 50734)
-- Name: episode episode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_pkey PRIMARY KEY (id);


--
-- TOC entry 5459 (class 2606 OID 50736)
-- Name: episode_user episode_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_user
    ADD CONSTRAINT episode_user_pkey PRIMARY KEY (id);


--
-- TOC entry 5461 (class 2606 OID 50738)
-- Name: file_geometry file_geometry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_geometry
    ADD CONSTRAINT file_geometry_pkey PRIMARY KEY (id);


--
-- TOC entry 5463 (class 2606 OID 50740)
-- Name: file_record file_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_record
    ADD CONSTRAINT file_record_pkey PRIMARY KEY (id);


--
-- TOC entry 5465 (class 2606 OID 50742)
-- Name: gis_asset gis_asset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_asset
    ADD CONSTRAINT gis_asset_pkey PRIMARY KEY (id);


--
-- TOC entry 5467 (class 2606 OID 50744)
-- Name: gis_layout gis_layout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_layout
    ADD CONSTRAINT gis_layout_pkey PRIMARY KEY (id);


--
-- TOC entry 5469 (class 2606 OID 50746)
-- Name: layer_filter layer_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layer_filter
    ADD CONSTRAINT layer_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 5471 (class 2606 OID 50748)
-- Name: layer_group layer_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layer_group
    ADD CONSTRAINT layer_group_pkey PRIMARY KEY (id);


--
-- TOC entry 5473 (class 2606 OID 50750)
-- Name: layeracp layeracp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layeracp
    ADD CONSTRAINT layeracp_pkey PRIMARY KEY (id);


--
-- TOC entry 5475 (class 2606 OID 50752)
-- Name: logbookrecord logbookrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logbookrecord
    ADD CONSTRAINT logbookrecord_pkey PRIMARY KEY (id);


--
-- TOC entry 5479 (class 2606 OID 50754)
-- Name: measurement_device measurement_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement_device
    ADD CONSTRAINT measurement_device_pkey PRIMARY KEY (id);


--
-- TOC entry 5477 (class 2606 OID 50756)
-- Name: measurement measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT measurement_pkey PRIMARY KEY (id);


--
-- TOC entry 5481 (class 2606 OID 50758)
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- TOC entry 5483 (class 2606 OID 50760)
-- Name: other_substance other_substance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_substance
    ADD CONSTRAINT other_substance_pkey PRIMARY KEY (id);


--
-- TOC entry 5485 (class 2606 OID 50762)
-- Name: panel panel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.panel
    ADD CONSTRAINT panel_pkey PRIMARY KEY (id);


--
-- TOC entry 5487 (class 2606 OID 50764)
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- TOC entry 5489 (class 2606 OID 50766)
-- Name: pollutant pollutant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollutant
    ADD CONSTRAINT pollutant_pkey PRIMARY KEY (id);


--
-- TOC entry 5491 (class 2606 OID 50768)
-- Name: pollution_episode pollution_episode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode
    ADD CONSTRAINT pollution_episode_pkey PRIMARY KEY (id);


--
-- TOC entry 5495 (class 2606 OID 50770)
-- Name: pollution_episode_segment pollution_episode_segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode_segment
    ADD CONSTRAINT pollution_episode_segment_pkey PRIMARY KEY (id);


--
-- TOC entry 5497 (class 2606 OID 50772)
-- Name: pollution_report pollution_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_report
    ADD CONSTRAINT pollution_report_pkey PRIMARY KEY (id);


--
-- TOC entry 5501 (class 2606 OID 50774)
-- Name: pollution_source pollution_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_source
    ADD CONSTRAINT pollution_source_pkey PRIMARY KEY (id);


--
-- TOC entry 5503 (class 2606 OID 50776)
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 5505 (class 2606 OID 50778)
-- Name: report_user report_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_user
    ADD CONSTRAINT report_user_pkey PRIMARY KEY (id);


--
-- TOC entry 5507 (class 2606 OID 50780)
-- Name: scat_report scat_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report
    ADD CONSTRAINT scat_report_pkey PRIMARY KEY (id);


--
-- TOC entry 5511 (class 2606 OID 50782)
-- Name: scat_zone scat_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_zone
    ADD CONSTRAINT scat_zone_pkey PRIMARY KEY (id);


--
-- TOC entry 5513 (class 2606 OID 50784)
-- Name: segment segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT segment_pkey PRIMARY KEY (id);


--
-- TOC entry 5515 (class 2606 OID 50786)
-- Name: spill spill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spill
    ADD CONSTRAINT spill_pkey PRIMARY KEY (id);


--
-- TOC entry 5517 (class 2606 OID 50788)
-- Name: subsurface_oil_condition subsurface_oil_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsurface_oil_condition
    ADD CONSTRAINT subsurface_oil_condition_pkey PRIMARY KEY (id);


--
-- TOC entry 5519 (class 2606 OID 50790)
-- Name: surface_oil_condition surface_oil_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surface_oil_condition
    ADD CONSTRAINT surface_oil_condition_pkey PRIMARY KEY (id);


--
-- TOC entry 5499 (class 2606 OID 50792)
-- Name: pollution_report uk_238il6qppa2bydvqj0i0ooo8e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_report
    ADD CONSTRAINT uk_238il6qppa2bydvqj0i0ooo8e UNIQUE (id);


--
-- TOC entry 5521 (class 2606 OID 50794)
-- Name: user_login uk_b1ho91o75rkwc54ypr1kb1ltp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT uk_b1ho91o75rkwc54ypr1kb1ltp UNIQUE (user_email);


--
-- TOC entry 5523 (class 2606 OID 50796)
-- Name: user_login uk_c9gphki9awsu7q9761s47312s; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT uk_c9gphki9awsu7q9761s47312s UNIQUE (user_name);


--
-- TOC entry 5493 (class 2606 OID 50798)
-- Name: pollution_episode uk_nx4o1l765ed7vid5jg2a7ur21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode
    ADD CONSTRAINT uk_nx4o1l765ed7vid5jg2a7ur21 UNIQUE (id);


--
-- TOC entry 5509 (class 2606 OID 50800)
-- Name: scat_report uk_olet3j5f2fcd2tkrjgbqn6ns6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report
    ADD CONSTRAINT uk_olet3j5f2fcd2tkrjgbqn6ns6 UNIQUE (id);


--
-- TOC entry 5527 (class 2606 OID 50802)
-- Name: user_login_layer_groups user_login_layer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login_layer_groups
    ADD CONSTRAINT user_login_layer_groups_pkey PRIMARY KEY (layer_groups, user_login);


--
-- TOC entry 5525 (class 2606 OID 50804)
-- Name: user_login user_login_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT user_login_pkey PRIMARY KEY (id);


--
-- TOC entry 5529 (class 2606 OID 50806)
-- Name: userrole userrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userrole
    ADD CONSTRAINT userrole_pkey PRIMARY KEY (id);


--
-- TOC entry 5451 (class 1259 OID 50807)
-- Name: episode_name_uidx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX episode_name_uidx ON public.episode USING btree (name);


--
-- TOC entry 5584 (class 2620 OID 50808)
-- Name: comment comment_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER comment_code_number BEFORE INSERT ON public.comment FOR EACH ROW EXECUTE FUNCTION public.comment_code_update();


--
-- TOC entry 5585 (class 2620 OID 50809)
-- Name: other_substance other_substance_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER other_substance_code_number BEFORE INSERT ON public.other_substance FOR EACH ROW EXECUTE FUNCTION public.other_substance_code_update();


--
-- TOC entry 5586 (class 2620 OID 50810)
-- Name: photo photo_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER photo_code_number BEFORE INSERT ON public.photo FOR EACH ROW EXECUTE FUNCTION public.photo_code_update();


--
-- TOC entry 5587 (class 2620 OID 50811)
-- Name: pollution_source pollution_source_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER pollution_source_code_number BEFORE INSERT ON public.pollution_source FOR EACH ROW EXECUTE FUNCTION public.pollution_source_code_update();


--
-- TOC entry 5588 (class 2620 OID 50812)
-- Name: scat_zone scat_zone_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER scat_zone_code_number BEFORE INSERT ON public.scat_zone FOR EACH ROW EXECUTE FUNCTION public.scat_zone_code_update();


--
-- TOC entry 5589 (class 2620 OID 50813)
-- Name: spill spill_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER spill_code_number BEFORE INSERT ON public.spill FOR EACH ROW EXECUTE FUNCTION public.spill_code_update();


--
-- TOC entry 5590 (class 2620 OID 50814)
-- Name: subsurface_oil_condition subsurface_oil_condition_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER subsurface_oil_condition_code_number BEFORE INSERT ON public.subsurface_oil_condition FOR EACH ROW EXECUTE FUNCTION public.subsurface_oil_condition_code_update();


--
-- TOC entry 5591 (class 2620 OID 50815)
-- Name: surface_oil_condition surface_oil_condition_code_number; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER surface_oil_condition_code_number BEFORE INSERT ON public.surface_oil_condition FOR EACH ROW EXECUTE FUNCTION public.surface_oil_condition_code_update();


--
-- TOC entry 5566 (class 2606 OID 50816)
-- Name: scat_report_contacts fk1pckgjnajqdv97h6bur0l5p9n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_contacts
    ADD CONSTRAINT fk1pckgjnajqdv97h6bur0l5p9n FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5542 (class 2606 OID 50821)
-- Name: gis_asset fk2mtnyjikq6ck2pny1s6icull; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_asset
    ADD CONSTRAINT fk2mtnyjikq6ck2pny1s6icull FOREIGN KEY (gislayout) REFERENCES public.gis_layout(id);


--
-- TOC entry 5570 (class 2606 OID 50826)
-- Name: scat_report_neighbour_segment_access fk2uxlc0t9539u0cwdvmlworubi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_neighbour_segment_access
    ADD CONSTRAINT fk2uxlc0t9539u0cwdvmlworubi FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5554 (class 2606 OID 50831)
-- Name: pollution_episode_segment fk39sna8xgdnp5uq788c48n610c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode_segment
    ADD CONSTRAINT fk39sna8xgdnp5uq788c48n610c FOREIGN KEY (segment) REFERENCES public.segment(id);


--
-- TOC entry 5544 (class 2606 OID 50836)
-- Name: layer_filter fk3dcitmugawdl1gg81eed4yipe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layer_filter
    ADD CONSTRAINT fk3dcitmugawdl1gg81eed4yipe FOREIGN KEY (layer) REFERENCES public.layeracp(id);


--
-- TOC entry 5572 (class 2606 OID 50841)
-- Name: scat_report_shoreline_types fk3wmm0o5f5ypbhca6aba2o0jhr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_shoreline_types
    ADD CONSTRAINT fk3wmm0o5f5ypbhca6aba2o0jhr FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5556 (class 2606 OID 50846)
-- Name: pollution_report fk402ejq9vjyohvxovnqrvkc9jn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_report
    ADD CONSTRAINT fk402ejq9vjyohvxovnqrvkc9jn FOREIGN KEY (pollution_episode) REFERENCES public.pollution_episode(id);


--
-- TOC entry 5550 (class 2606 OID 50851)
-- Name: other_substance fk556402dcfb1dbde8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.other_substance
    ADD CONSTRAINT fk556402dcfb1dbde8 FOREIGN KEY (report) REFERENCES public.scat_report(id) ON DELETE CASCADE;


--
-- TOC entry 5559 (class 2606 OID 50856)
-- Name: report_user fk605e6b8f42fbbf13; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_user
    ADD CONSTRAINT fk605e6b8f42fbbf13 FOREIGN KEY (user_login) REFERENCES public.user_login(id) ON DELETE CASCADE;


--
-- TOC entry 5560 (class 2606 OID 50861)
-- Name: scat_report fk6lvieeqox5ajltp9sahl9ynw6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report
    ADD CONSTRAINT fk6lvieeqox5ajltp9sahl9ynw6 FOREIGN KEY (surveyed_segment) REFERENCES public.segment(id);


--
-- TOC entry 5537 (class 2606 OID 50866)
-- Name: episode_user fk7dva976jvv478nwdudbfsiaew; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_user
    ADD CONSTRAINT fk7dva976jvv478nwdudbfsiaew FOREIGN KEY (user_login) REFERENCES public.user_login(id);


--
-- TOC entry 5533 (class 2606 OID 50871)
-- Name: episode fk9fqc9urxp6h9b3l1ljywpl9c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT fk9fqc9urxp6h9b3l1ljywpl9c7 FOREIGN KEY (public_user) REFERENCES public.episode_user(id);


--
-- TOC entry 5552 (class 2606 OID 50876)
-- Name: pollution_episode fk_3xs4iw4fsruoxu2gsnhkrytc8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode
    ADD CONSTRAINT fk_3xs4iw4fsruoxu2gsnhkrytc8 FOREIGN KEY (public_user) REFERENCES public.episode_user(id);


--
-- TOC entry 5557 (class 2606 OID 50881)
-- Name: pollution_report fk_lu39ici53a4dotel0byiv0dnv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_report
    ADD CONSTRAINT fk_lu39ici53a4dotel0byiv0dnv FOREIGN KEY (author) REFERENCES public.user_login(id);


--
-- TOC entry 5561 (class 2606 OID 50886)
-- Name: scat_report fk_np55w5xjydfhwckh9k1srwg3y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report
    ADD CONSTRAINT fk_np55w5xjydfhwckh9k1srwg3y FOREIGN KEY (author) REFERENCES public.user_login(id);


--
-- TOC entry 5531 (class 2606 OID 50891)
-- Name: comment fka2h9o02adq7t5hui6oy83ejge; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT fka2h9o02adq7t5hui6oy83ejge FOREIGN KEY (user_login) REFERENCES public.user_login(id);


--
-- TOC entry 5582 (class 2606 OID 50896)
-- Name: userlogin_userauthorities fkag0shpjdscj2v9yw166moth6s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userlogin_userauthorities
    ADD CONSTRAINT fkag0shpjdscj2v9yw166moth6s FOREIGN KEY (userlogin) REFERENCES public.user_login(id);


--
-- TOC entry 5545 (class 2606 OID 50901)
-- Name: layer_group fkb4jpx8s4ns3dp1p6u4ymts4px; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layer_group
    ADD CONSTRAINT fkb4jpx8s4ns3dp1p6u4ymts4px FOREIGN KEY (panel) REFERENCES public.panel(id) ON DELETE SET NULL;


--
-- TOC entry 5553 (class 2606 OID 50906)
-- Name: pollution_episode fkc822c55347c3ae6a912e6a669; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode
    ADD CONSTRAINT fkc822c55347c3ae6a912e6a669 FOREIGN KEY (author) REFERENCES public.user_login(id) ON DELETE SET NULL;


--
-- TOC entry 5534 (class 2606 OID 50911)
-- Name: episode fkc823c55347c3ae6a912e6a669; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT fkc823c55347c3ae6a912e6a669 FOREIGN KEY (author) REFERENCES public.user_login(id) ON DELETE SET NULL;


--
-- TOC entry 5548 (class 2606 OID 50916)
-- Name: logbookrecord fkcyw93tr3y48dte7r1tx0gox68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logbookrecord
    ADD CONSTRAINT fkcyw93tr3y48dte7r1tx0gox68 FOREIGN KEY (createdby) REFERENCES public.user_login(id);


--
-- TOC entry 5541 (class 2606 OID 50921)
-- Name: file_record fkd9qpe5tr591xktbj2fl2hpvde; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_record
    ADD CONSTRAINT fkd9qpe5tr591xktbj2fl2hpvde FOREIGN KEY (user_login) REFERENCES public.user_login(id);


--
-- TOC entry 5555 (class 2606 OID 50926)
-- Name: pollution_episode_segment fkdb2mhbt9uuwnvs427vb9s7suq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollution_episode_segment
    ADD CONSTRAINT fkdb2mhbt9uuwnvs427vb9s7suq FOREIGN KEY (pollution_episode) REFERENCES public.pollution_episode(id);


--
-- TOC entry 5578 (class 2606 OID 50931)
-- Name: surface_oil_condition fkdpi2hygjamhbpomg8us4p0x5s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surface_oil_condition
    ADD CONSTRAINT fkdpi2hygjamhbpomg8us4p0x5s FOREIGN KEY (report) REFERENCES public.scat_report(id);


--
-- TOC entry 5536 (class 2606 OID 50936)
-- Name: episode_observer fked12pe1hk3g1hshncq222l7cy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_observer
    ADD CONSTRAINT fked12pe1hk3g1hshncq222l7cy FOREIGN KEY (user_login) REFERENCES public.user_login(id);


--
-- TOC entry 5540 (class 2606 OID 50941)
-- Name: file_geometry fkevpbt3yoe431w05eb7e8vdds2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_geometry
    ADD CONSTRAINT fkevpbt3yoe431w05eb7e8vdds2 FOREIGN KEY (file) REFERENCES public.file_record(id);


--
-- TOC entry 5577 (class 2606 OID 50946)
-- Name: subsurface_oil_condition_sediment_types fkey0ra1c7lf0cug6902f54cd52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsurface_oil_condition_sediment_types
    ADD CONSTRAINT fkey0ra1c7lf0cug6902f54cd52 FOREIGN KEY (subsurface_oil_condition) REFERENCES public.subsurface_oil_condition(id);


--
-- TOC entry 5569 (class 2606 OID 50951)
-- Name: scat_report_local_features fkfm7o1eby32n0y4xfmaa56nlx3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_local_features
    ADD CONSTRAINT fkfm7o1eby32n0y4xfmaa56nlx3 FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5543 (class 2606 OID 50956)
-- Name: gis_layout fkgis_layout_userlogin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gis_layout
    ADD CONSTRAINT fkgis_layout_userlogin FOREIGN KEY (createdby) REFERENCES public.user_login(id) ON DELETE SET NULL;


--
-- TOC entry 5576 (class 2606 OID 50961)
-- Name: subsurface_oil_condition fkgm3tx8nkaa3w197mf0tu3hqeh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subsurface_oil_condition
    ADD CONSTRAINT fkgm3tx8nkaa3w197mf0tu3hqeh FOREIGN KEY (report) REFERENCES public.scat_report(id);


--
-- TOC entry 5579 (class 2606 OID 50966)
-- Name: user_login fkhjx7gwrn3hbpikip1urlustk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login
    ADD CONSTRAINT fkhjx7gwrn3hbpikip1urlustk4 FOREIGN KEY (user_role) REFERENCES public.userrole(id);


--
-- TOC entry 5574 (class 2606 OID 50971)
-- Name: scat_zone fki186ayoydir2t53jcpqgku697; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_zone
    ADD CONSTRAINT fki186ayoydir2t53jcpqgku697 FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5575 (class 2606 OID 50976)
-- Name: spill fki59h9lln5qysmll9163m12a7m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spill
    ADD CONSTRAINT fki59h9lln5qysmll9163m12a7m FOREIGN KEY (pollutant) REFERENCES public.pollutant(id);


--
-- TOC entry 5546 (class 2606 OID 50981)
-- Name: layeracp fki7o2p95ghcqvfm3weut51qi9e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layeracp
    ADD CONSTRAINT fki7o2p95ghcqvfm3weut51qi9e FOREIGN KEY (id) REFERENCES public.layeracp(id);


--
-- TOC entry 5538 (class 2606 OID 50986)
-- Name: episode_user_layers fkicc3a8v1frsjhx5qpovanjbie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_user_layers
    ADD CONSTRAINT fkicc3a8v1frsjhx5qpovanjbie FOREIGN KEY (episode_user) REFERENCES public.episode_user(id);


--
-- TOC entry 5564 (class 2606 OID 50991)
-- Name: scat_report_algaes fkj0edu34gnagqxw09rw0f29sh5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_algaes
    ADD CONSTRAINT fkj0edu34gnagqxw09rw0f29sh5 FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5562 (class 2606 OID 50996)
-- Name: scat_report fkj4um8hhdj2911op873f2q35s1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report
    ADD CONSTRAINT fkj4um8hhdj2911op873f2q35s1 FOREIGN KEY (pollution_episode) REFERENCES public.pollution_episode(id);


--
-- TOC entry 5532 (class 2606 OID 51001)
-- Name: configparams fkjevdtt6njde6uj3s3h2468a5r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configparams
    ADD CONSTRAINT fkjevdtt6njde6uj3s3h2468a5r FOREIGN KEY (userlogin) REFERENCES public.user_login(id);


--
-- TOC entry 5568 (class 2606 OID 51006)
-- Name: scat_report_direct_backshore_access fkjwprs6fegovih4asa9nawpwvj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_direct_backshore_access
    ADD CONSTRAINT fkjwprs6fegovih4asa9nawpwvj FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5551 (class 2606 OID 51011)
-- Name: photo fkkbyk9gh06hvl4k12ervijqc68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT fkkbyk9gh06hvl4k12ervijqc68 FOREIGN KEY (user_login) REFERENCES public.user_login(id);


--
-- TOC entry 5565 (class 2606 OID 51016)
-- Name: scat_report_conservation fkkcl5i2uuk3axndh3tj4xlpwjr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_conservation
    ADD CONSTRAINT fkkcl5i2uuk3axndh3tj4xlpwjr FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5530 (class 2606 OID 51021)
-- Name: bookmark fkksj9dhjjytmvtw61vslqgwmqt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookmark
    ADD CONSTRAINT fkksj9dhjjytmvtw61vslqgwmqt FOREIGN KEY (userlogin) REFERENCES public.user_login(id);


--
-- TOC entry 5571 (class 2606 OID 51026)
-- Name: scat_report_oiled_faunas fkkw0ylgpg0u99ee8befg04h44i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_oiled_faunas
    ADD CONSTRAINT fkkw0ylgpg0u99ee8befg04h44i FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5539 (class 2606 OID 51031)
-- Name: episode_user_layers fkn42yq812kj3lr5eox15gyldv7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_user_layers
    ADD CONSTRAINT fkn42yq812kj3lr5eox15gyldv7 FOREIGN KEY (layers) REFERENCES public.layeracp(id);


--
-- TOC entry 5580 (class 2606 OID 51036)
-- Name: user_login_layer_groups fknp1w4qtf11um6j8mkxc5j9ry9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login_layer_groups
    ADD CONSTRAINT fknp1w4qtf11um6j8mkxc5j9ry9 FOREIGN KEY (user_login) REFERENCES public.layer_group(id);


--
-- TOC entry 5573 (class 2606 OID 51041)
-- Name: scat_report_uses fko477v83bp4j32uqo1e2u0oey6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_uses
    ADD CONSTRAINT fko477v83bp4j32uqo1e2u0oey6 FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5558 (class 2606 OID 51046)
-- Name: report fko7b5ndikxu6g6i312al6tum29; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT fko7b5ndikxu6g6i312al6tum29 FOREIGN KEY (author) REFERENCES public.user_login(id);


--
-- TOC entry 5549 (class 2606 OID 51051)
-- Name: measurement fkom60q0tr2p3bgvpl6msilcr6p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT fkom60q0tr2p3bgvpl6msilcr6p FOREIGN KEY (measurement_device) REFERENCES public.measurement_device(id);


--
-- TOC entry 5547 (class 2606 OID 51056)
-- Name: layeracp fkovi6mx14f12k8xbu89f8ploeb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layeracp
    ADD CONSTRAINT fkovi6mx14f12k8xbu89f8ploeb FOREIGN KEY (layer_group) REFERENCES public.layer_group(id) ON DELETE SET NULL;


--
-- TOC entry 5567 (class 2606 OID 51061)
-- Name: scat_report_debrises fkqt8n6ic7oqeu60wslmq64hx9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report_debrises
    ADD CONSTRAINT fkqt8n6ic7oqeu60wslmq64hx9s FOREIGN KEY (scat_report) REFERENCES public.scat_report(id);


--
-- TOC entry 5583 (class 2606 OID 51066)
-- Name: userrole_authorities fkr4oeb08fbw10q9fdpej5hmqpc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userrole_authorities
    ADD CONSTRAINT fkr4oeb08fbw10q9fdpej5hmqpc FOREIGN KEY (userrole) REFERENCES public.userrole(id);


--
-- TOC entry 5563 (class 2606 OID 51071)
-- Name: scat_report fkri10qjxnyfrdup96byglgs1du; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scat_report
    ADD CONSTRAINT fkri10qjxnyfrdup96byglgs1du FOREIGN KEY (segment) REFERENCES public.segment(id);


--
-- TOC entry 5581 (class 2606 OID 51076)
-- Name: user_login_layer_groups fkrtmsyer8063vvscyth3w9onn7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login_layer_groups
    ADD CONSTRAINT fkrtmsyer8063vvscyth3w9onn7 FOREIGN KEY (layer_groups) REFERENCES public.user_login(id);


--
-- TOC entry 5535 (class 2606 OID 51081)
-- Name: episode_layer fktfgjjqrvrdgcrpdga7spquchq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode_layer
    ADD CONSTRAINT fktfgjjqrvrdgcrpdga7spquchq FOREIGN KEY (layer) REFERENCES public.layeracp(id);


--
-- TOC entry 5806 (class 0 OID 0)
-- Dependencies: 1110
-- Name: FUNCTION box2d_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box2d_in(cstring) TO coptool;


--
-- TOC entry 5807 (class 0 OID 0)
-- Dependencies: 311
-- Name: FUNCTION box2d_out(public.box2d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box2d_out(public.box2d) TO coptool;


--
-- TOC entry 5808 (class 0 OID 0)
-- Dependencies: 312
-- Name: FUNCTION box2df_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box2df_in(cstring) TO coptool;


--
-- TOC entry 5809 (class 0 OID 0)
-- Dependencies: 1111
-- Name: FUNCTION box2df_out(public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box2df_out(public.box2df) TO coptool;


--
-- TOC entry 5810 (class 0 OID 0)
-- Dependencies: 313
-- Name: FUNCTION box3d_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box3d_in(cstring) TO coptool;


--
-- TOC entry 5811 (class 0 OID 0)
-- Dependencies: 314
-- Name: FUNCTION box3d_out(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box3d_out(public.box3d) TO coptool;


--
-- TOC entry 5812 (class 0 OID 0)
-- Dependencies: 1112
-- Name: FUNCTION geography_analyze(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_analyze(internal) TO coptool;


--
-- TOC entry 5813 (class 0 OID 0)
-- Dependencies: 1113
-- Name: FUNCTION geography_in(cstring, oid, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_in(cstring, oid, integer) TO coptool;


--
-- TOC entry 5814 (class 0 OID 0)
-- Dependencies: 675
-- Name: FUNCTION geography_out(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_out(public.geography) TO coptool;


--
-- TOC entry 5815 (class 0 OID 0)
-- Dependencies: 1114
-- Name: FUNCTION geography_recv(internal, oid, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_recv(internal, oid, integer) TO coptool;


--
-- TOC entry 5816 (class 0 OID 0)
-- Dependencies: 1115
-- Name: FUNCTION geography_send(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_send(public.geography) TO coptool;


--
-- TOC entry 5817 (class 0 OID 0)
-- Dependencies: 1116
-- Name: FUNCTION geography_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_typmod_in(cstring[]) TO coptool;


--
-- TOC entry 5818 (class 0 OID 0)
-- Dependencies: 676
-- Name: FUNCTION geography_typmod_out(integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_typmod_out(integer) TO coptool;


--
-- TOC entry 5819 (class 0 OID 0)
-- Dependencies: 315
-- Name: FUNCTION geometry_analyze(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_analyze(internal) TO coptool;


--
-- TOC entry 5820 (class 0 OID 0)
-- Dependencies: 1117
-- Name: FUNCTION geometry_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_in(cstring) TO coptool;


--
-- TOC entry 5821 (class 0 OID 0)
-- Dependencies: 1118
-- Name: FUNCTION geometry_out(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_out(public.geometry) TO coptool;


--
-- TOC entry 5822 (class 0 OID 0)
-- Dependencies: 316
-- Name: FUNCTION geometry_recv(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_recv(internal) TO coptool;


--
-- TOC entry 5823 (class 0 OID 0)
-- Dependencies: 1119
-- Name: FUNCTION geometry_send(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_send(public.geometry) TO coptool;


--
-- TOC entry 5824 (class 0 OID 0)
-- Dependencies: 1120
-- Name: FUNCTION geometry_typmod_in(cstring[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_typmod_in(cstring[]) TO coptool;


--
-- TOC entry 5825 (class 0 OID 0)
-- Dependencies: 308
-- Name: FUNCTION geometry_typmod_out(integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_typmod_out(integer) TO coptool;


--
-- TOC entry 5826 (class 0 OID 0)
-- Dependencies: 317
-- Name: FUNCTION gidx_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gidx_in(cstring) TO coptool;


--
-- TOC entry 5827 (class 0 OID 0)
-- Dependencies: 1121
-- Name: FUNCTION gidx_out(public.gidx); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gidx_out(public.gidx) TO coptool;


--
-- TOC entry 5828 (class 0 OID 0)
-- Dependencies: 300
-- Name: FUNCTION spheroid_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.spheroid_in(cstring) TO coptool;


--
-- TOC entry 5829 (class 0 OID 0)
-- Dependencies: 301
-- Name: FUNCTION spheroid_out(public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.spheroid_out(public.spheroid) TO coptool;


--
-- TOC entry 5830 (class 0 OID 0)
-- Dependencies: 1122
-- Name: FUNCTION _postgis_deprecate(oldname text, newname text, version text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_deprecate(oldname text, newname text, version text) TO coptool;


--
-- TOC entry 5831 (class 0 OID 0)
-- Dependencies: 1123
-- Name: FUNCTION _postgis_index_extent(tbl regclass, col text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_index_extent(tbl regclass, col text) TO coptool;


--
-- TOC entry 5832 (class 0 OID 0)
-- Dependencies: 1124
-- Name: FUNCTION _postgis_join_selectivity(regclass, text, regclass, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_join_selectivity(regclass, text, regclass, text, text) TO coptool;


--
-- TOC entry 5833 (class 0 OID 0)
-- Dependencies: 1125
-- Name: FUNCTION _postgis_pgsql_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_pgsql_version() TO coptool;


--
-- TOC entry 5834 (class 0 OID 0)
-- Dependencies: 448
-- Name: FUNCTION _postgis_scripts_pgsql_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_scripts_pgsql_version() TO coptool;


--
-- TOC entry 5835 (class 0 OID 0)
-- Dependencies: 1126
-- Name: FUNCTION _postgis_selectivity(tbl regclass, att_name text, geom public.geometry, mode text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_selectivity(tbl regclass, att_name text, geom public.geometry, mode text) TO coptool;


--
-- TOC entry 5836 (class 0 OID 0)
-- Dependencies: 1127
-- Name: FUNCTION _postgis_stats(tbl regclass, att_name text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._postgis_stats(tbl regclass, att_name text, text) TO coptool;


--
-- TOC entry 5837 (class 0 OID 0)
-- Dependencies: 1128
-- Name: FUNCTION _st_3ddfullywithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_3ddfullywithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 5838 (class 0 OID 0)
-- Dependencies: 547
-- Name: FUNCTION _st_3ddwithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_3ddwithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 5839 (class 0 OID 0)
-- Dependencies: 548
-- Name: FUNCTION _st_3dintersects(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_3dintersects(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5840 (class 0 OID 0)
-- Dependencies: 1129
-- Name: FUNCTION _st_asgml(integer, public.geometry, integer, integer, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_asgml(integer, public.geometry, integer, integer, text, text) TO coptool;


--
-- TOC entry 5841 (class 0 OID 0)
-- Dependencies: 1130
-- Name: FUNCTION _st_asx3d(integer, public.geometry, integer, integer, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_asx3d(integer, public.geometry, integer, integer, text) TO coptool;


--
-- TOC entry 5842 (class 0 OID 0)
-- Dependencies: 1131
-- Name: FUNCTION _st_bestsrid(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_bestsrid(public.geography) TO coptool;


--
-- TOC entry 5843 (class 0 OID 0)
-- Dependencies: 730
-- Name: FUNCTION _st_bestsrid(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_bestsrid(public.geography, public.geography) TO coptool;


--
-- TOC entry 5844 (class 0 OID 0)
-- Dependencies: 1132
-- Name: FUNCTION _st_concavehull(param_inputgeom public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_concavehull(param_inputgeom public.geometry) TO coptool;


--
-- TOC entry 5845 (class 0 OID 0)
-- Dependencies: 1133
-- Name: FUNCTION _st_contains(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_contains(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5846 (class 0 OID 0)
-- Dependencies: 549
-- Name: FUNCTION _st_containsproperly(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_containsproperly(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5847 (class 0 OID 0)
-- Dependencies: 1134
-- Name: FUNCTION _st_coveredby(geog1 public.geography, geog2 public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_coveredby(geog1 public.geography, geog2 public.geography) TO coptool;


--
-- TOC entry 5848 (class 0 OID 0)
-- Dependencies: 1135
-- Name: FUNCTION _st_coveredby(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_coveredby(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5849 (class 0 OID 0)
-- Dependencies: 686
-- Name: FUNCTION _st_covers(geog1 public.geography, geog2 public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_covers(geog1 public.geography, geog2 public.geography) TO coptool;


--
-- TOC entry 5850 (class 0 OID 0)
-- Dependencies: 550
-- Name: FUNCTION _st_covers(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_covers(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5851 (class 0 OID 0)
-- Dependencies: 529
-- Name: FUNCTION _st_crosses(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_crosses(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5852 (class 0 OID 0)
-- Dependencies: 551
-- Name: FUNCTION _st_dfullywithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_dfullywithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 5853 (class 0 OID 0)
-- Dependencies: 1136
-- Name: FUNCTION _st_distancetree(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_distancetree(public.geography, public.geography) TO coptool;


--
-- TOC entry 5854 (class 0 OID 0)
-- Dependencies: 1137
-- Name: FUNCTION _st_distancetree(public.geography, public.geography, double precision, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_distancetree(public.geography, public.geography, double precision, boolean) TO coptool;


--
-- TOC entry 5855 (class 0 OID 0)
-- Dependencies: 713
-- Name: FUNCTION _st_distanceuncached(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_distanceuncached(public.geography, public.geography) TO coptool;


--
-- TOC entry 5856 (class 0 OID 0)
-- Dependencies: 714
-- Name: FUNCTION _st_distanceuncached(public.geography, public.geography, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_distanceuncached(public.geography, public.geography, boolean) TO coptool;


--
-- TOC entry 5857 (class 0 OID 0)
-- Dependencies: 715
-- Name: FUNCTION _st_distanceuncached(public.geography, public.geography, double precision, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_distanceuncached(public.geography, public.geography, double precision, boolean) TO coptool;


--
-- TOC entry 5858 (class 0 OID 0)
-- Dependencies: 1138
-- Name: FUNCTION _st_dwithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_dwithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 5859 (class 0 OID 0)
-- Dependencies: 1139
-- Name: FUNCTION _st_dwithin(geog1 public.geography, geog2 public.geography, tolerance double precision, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_dwithin(geog1 public.geography, geog2 public.geography, tolerance double precision, use_spheroid boolean) TO coptool;


--
-- TOC entry 5860 (class 0 OID 0)
-- Dependencies: 1140
-- Name: FUNCTION _st_dwithinuncached(public.geography, public.geography, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_dwithinuncached(public.geography, public.geography, double precision) TO coptool;


--
-- TOC entry 5861 (class 0 OID 0)
-- Dependencies: 716
-- Name: FUNCTION _st_dwithinuncached(public.geography, public.geography, double precision, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_dwithinuncached(public.geography, public.geography, double precision, boolean) TO coptool;


--
-- TOC entry 5862 (class 0 OID 0)
-- Dependencies: 552
-- Name: FUNCTION _st_equals(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_equals(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5863 (class 0 OID 0)
-- Dependencies: 717
-- Name: FUNCTION _st_expand(public.geography, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_expand(public.geography, double precision) TO coptool;


--
-- TOC entry 5864 (class 0 OID 0)
-- Dependencies: 571
-- Name: FUNCTION _st_geomfromgml(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_geomfromgml(text, integer) TO coptool;


--
-- TOC entry 5865 (class 0 OID 0)
-- Dependencies: 530
-- Name: FUNCTION _st_intersects(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_intersects(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5866 (class 0 OID 0)
-- Dependencies: 531
-- Name: FUNCTION _st_linecrossingdirection(line1 public.geometry, line2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_linecrossingdirection(line1 public.geometry, line2 public.geometry) TO coptool;


--
-- TOC entry 5867 (class 0 OID 0)
-- Dependencies: 655
-- Name: FUNCTION _st_longestline(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_longestline(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5868 (class 0 OID 0)
-- Dependencies: 1141
-- Name: FUNCTION _st_maxdistance(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_maxdistance(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5869 (class 0 OID 0)
-- Dependencies: 553
-- Name: FUNCTION _st_orderingequals(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_orderingequals(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5870 (class 0 OID 0)
-- Dependencies: 1142
-- Name: FUNCTION _st_overlaps(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_overlaps(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5871 (class 0 OID 0)
-- Dependencies: 731
-- Name: FUNCTION _st_pointoutside(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_pointoutside(public.geography) TO coptool;


--
-- TOC entry 5872 (class 0 OID 0)
-- Dependencies: 1143
-- Name: FUNCTION _st_sortablehash(geom public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_sortablehash(geom public.geometry) TO coptool;


--
-- TOC entry 5873 (class 0 OID 0)
-- Dependencies: 532
-- Name: FUNCTION _st_touches(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_touches(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5874 (class 0 OID 0)
-- Dependencies: 1144
-- Name: FUNCTION _st_voronoi(g1 public.geometry, clip public.geometry, tolerance double precision, return_polygons boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_voronoi(g1 public.geometry, clip public.geometry, tolerance double precision, return_polygons boolean) TO coptool;


--
-- TOC entry 5875 (class 0 OID 0)
-- Dependencies: 554
-- Name: FUNCTION _st_within(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public._st_within(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5876 (class 0 OID 0)
-- Dependencies: 1145
-- Name: FUNCTION addauth(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addauth(text) TO coptool;


--
-- TOC entry 5877 (class 0 OID 0)
-- Dependencies: 1146
-- Name: FUNCTION addbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addbbox(public.geometry) TO coptool;


--
-- TOC entry 5878 (class 0 OID 0)
-- Dependencies: 1147
-- Name: FUNCTION addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addgeometrycolumn(table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) TO coptool;


--
-- TOC entry 5879 (class 0 OID 0)
-- Dependencies: 1148
-- Name: FUNCTION addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying, new_srid integer, new_type character varying, new_dim integer, use_typmod boolean) TO coptool;


--
-- TOC entry 5880 (class 0 OID 0)
-- Dependencies: 418
-- Name: FUNCTION addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer, new_type character varying, new_dim integer, use_typmod boolean) TO coptool;


--
-- TOC entry 5881 (class 0 OID 0)
-- Dependencies: 1149
-- Name: FUNCTION addpoint(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addpoint(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5882 (class 0 OID 0)
-- Dependencies: 931
-- Name: FUNCTION addpoint(public.geometry, public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.addpoint(public.geometry, public.geometry, integer) TO coptool;


--
-- TOC entry 5883 (class 0 OID 0)
-- Dependencies: 1150
-- Name: FUNCTION affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 5884 (class 0 OID 0)
-- Dependencies: 905
-- Name: FUNCTION affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 5885 (class 0 OID 0)
-- Dependencies: 932
-- Name: FUNCTION area(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.area(public.geometry) TO coptool;


--
-- TOC entry 5886 (class 0 OID 0)
-- Dependencies: 1151
-- Name: FUNCTION area2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.area2d(public.geometry) TO coptool;


--
-- TOC entry 5887 (class 0 OID 0)
-- Dependencies: 883
-- Name: FUNCTION asbinary(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asbinary(public.geometry) TO coptool;


--
-- TOC entry 5888 (class 0 OID 0)
-- Dependencies: 1152
-- Name: FUNCTION asbinary(public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asbinary(public.geometry, text) TO coptool;


--
-- TOC entry 5889 (class 0 OID 0)
-- Dependencies: 933
-- Name: FUNCTION asewkb(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asewkb(public.geometry) TO coptool;


--
-- TOC entry 5890 (class 0 OID 0)
-- Dependencies: 934
-- Name: FUNCTION asewkb(public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asewkb(public.geometry, text) TO coptool;


--
-- TOC entry 5891 (class 0 OID 0)
-- Dependencies: 935
-- Name: FUNCTION asewkt(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asewkt(public.geometry) TO coptool;


--
-- TOC entry 5892 (class 0 OID 0)
-- Dependencies: 1153
-- Name: FUNCTION asgml(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asgml(public.geometry) TO coptool;


--
-- TOC entry 5893 (class 0 OID 0)
-- Dependencies: 936
-- Name: FUNCTION asgml(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.asgml(public.geometry, integer) TO coptool;


--
-- TOC entry 5894 (class 0 OID 0)
-- Dependencies: 937
-- Name: FUNCTION ashexewkb(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.ashexewkb(public.geometry) TO coptool;


--
-- TOC entry 5895 (class 0 OID 0)
-- Dependencies: 938
-- Name: FUNCTION ashexewkb(public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.ashexewkb(public.geometry, text) TO coptool;


--
-- TOC entry 5896 (class 0 OID 0)
-- Dependencies: 939
-- Name: FUNCTION askml(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.askml(public.geometry) TO coptool;


--
-- TOC entry 5897 (class 0 OID 0)
-- Dependencies: 1154
-- Name: FUNCTION askml(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.askml(public.geometry, integer) TO coptool;


--
-- TOC entry 5898 (class 0 OID 0)
-- Dependencies: 940
-- Name: FUNCTION askml(integer, public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.askml(integer, public.geometry, integer) TO coptool;


--
-- TOC entry 5899 (class 0 OID 0)
-- Dependencies: 941
-- Name: FUNCTION assvg(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.assvg(public.geometry) TO coptool;


--
-- TOC entry 5900 (class 0 OID 0)
-- Dependencies: 942
-- Name: FUNCTION assvg(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.assvg(public.geometry, integer) TO coptool;


--
-- TOC entry 5901 (class 0 OID 0)
-- Dependencies: 943
-- Name: FUNCTION assvg(public.geometry, integer, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.assvg(public.geometry, integer, integer) TO coptool;


--
-- TOC entry 5902 (class 0 OID 0)
-- Dependencies: 884
-- Name: FUNCTION astext(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.astext(public.geometry) TO coptool;


--
-- TOC entry 5903 (class 0 OID 0)
-- Dependencies: 1155
-- Name: FUNCTION azimuth(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.azimuth(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5904 (class 0 OID 0)
-- Dependencies: 1156
-- Name: FUNCTION bdmpolyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.bdmpolyfromtext(text, integer) TO coptool;


--
-- TOC entry 5905 (class 0 OID 0)
-- Dependencies: 944
-- Name: FUNCTION bdpolyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.bdpolyfromtext(text, integer) TO coptool;


--
-- TOC entry 5906 (class 0 OID 0)
-- Dependencies: 945
-- Name: FUNCTION boundary(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.boundary(public.geometry) TO coptool;


--
-- TOC entry 5907 (class 0 OID 0)
-- Dependencies: 1157
-- Name: FUNCTION box(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box(public.box3d) TO coptool;


--
-- TOC entry 5908 (class 0 OID 0)
-- Dependencies: 449
-- Name: FUNCTION box(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box(public.geometry) TO coptool;


--
-- TOC entry 5909 (class 0 OID 0)
-- Dependencies: 450
-- Name: FUNCTION box2d(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box2d(public.box3d) TO coptool;


--
-- TOC entry 5910 (class 0 OID 0)
-- Dependencies: 451
-- Name: FUNCTION box2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box2d(public.geometry) TO coptool;


--
-- TOC entry 5911 (class 0 OID 0)
-- Dependencies: 467
-- Name: FUNCTION box3d(public.box2d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box3d(public.box2d) TO coptool;


--
-- TOC entry 5912 (class 0 OID 0)
-- Dependencies: 1158
-- Name: FUNCTION box3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box3d(public.geometry) TO coptool;


--
-- TOC entry 5913 (class 0 OID 0)
-- Dependencies: 1159
-- Name: FUNCTION box3dtobox(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.box3dtobox(public.box3d) TO coptool;


--
-- TOC entry 5914 (class 0 OID 0)
-- Dependencies: 946
-- Name: FUNCTION buffer(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.buffer(public.geometry, double precision) TO coptool;


--
-- TOC entry 5915 (class 0 OID 0)
-- Dependencies: 947
-- Name: FUNCTION buffer(public.geometry, double precision, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.buffer(public.geometry, double precision, integer) TO coptool;


--
-- TOC entry 5916 (class 0 OID 0)
-- Dependencies: 948
-- Name: FUNCTION buildarea(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.buildarea(public.geometry) TO coptool;


--
-- TOC entry 5917 (class 0 OID 0)
-- Dependencies: 687
-- Name: FUNCTION bytea(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.bytea(public.geography) TO coptool;


--
-- TOC entry 5918 (class 0 OID 0)
-- Dependencies: 468
-- Name: FUNCTION bytea(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.bytea(public.geometry) TO coptool;


--
-- TOC entry 5919 (class 0 OID 0)
-- Dependencies: 949
-- Name: FUNCTION centroid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.centroid(public.geometry) TO coptool;


--
-- TOC entry 5920 (class 0 OID 0)
-- Dependencies: 677
-- Name: FUNCTION checkauth(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.checkauth(text, text) TO coptool;


--
-- TOC entry 5921 (class 0 OID 0)
-- Dependencies: 678
-- Name: FUNCTION checkauth(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.checkauth(text, text, text) TO coptool;


--
-- TOC entry 5922 (class 0 OID 0)
-- Dependencies: 679
-- Name: FUNCTION checkauthtrigger(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.checkauthtrigger() TO coptool;


--
-- TOC entry 5923 (class 0 OID 0)
-- Dependencies: 1160
-- Name: FUNCTION collect(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.collect(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5924 (class 0 OID 0)
-- Dependencies: 1089
-- Name: FUNCTION combine_bbox(public.box2d, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.combine_bbox(public.box2d, public.geometry) TO coptool;


--
-- TOC entry 5925 (class 0 OID 0)
-- Dependencies: 1090
-- Name: FUNCTION combine_bbox(public.box3d, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.combine_bbox(public.box3d, public.geometry) TO coptool;


--
-- TOC entry 5926 (class 0 OID 0)
-- Dependencies: 950
-- Name: FUNCTION contains(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.contains(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5927 (class 0 OID 0)
-- Dependencies: 1161
-- Name: FUNCTION contains_2d(public.box2df, public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.contains_2d(public.box2df, public.box2df) TO coptool;


--
-- TOC entry 5928 (class 0 OID 0)
-- Dependencies: 1162
-- Name: FUNCTION contains_2d(public.box2df, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.contains_2d(public.box2df, public.geometry) TO coptool;


--
-- TOC entry 5929 (class 0 OID 0)
-- Dependencies: 770
-- Name: FUNCTION contains_2d(public.geometry, public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.contains_2d(public.geometry, public.box2df) TO coptool;


--
-- TOC entry 5930 (class 0 OID 0)
-- Dependencies: 951
-- Name: FUNCTION convexhull(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.convexhull(public.geometry) TO coptool;


--
-- TOC entry 5931 (class 0 OID 0)
-- Dependencies: 952
-- Name: FUNCTION crosses(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.crosses(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5932 (class 0 OID 0)
-- Dependencies: 953
-- Name: FUNCTION difference(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.difference(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5933 (class 0 OID 0)
-- Dependencies: 954
-- Name: FUNCTION dimension(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dimension(public.geometry) TO coptool;


--
-- TOC entry 5934 (class 0 OID 0)
-- Dependencies: 1164
-- Name: FUNCTION disablelongtransactions(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.disablelongtransactions() TO coptool;


--
-- TOC entry 5935 (class 0 OID 0)
-- Dependencies: 1165
-- Name: FUNCTION disjoint(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.disjoint(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5936 (class 0 OID 0)
-- Dependencies: 955
-- Name: FUNCTION distance(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.distance(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5937 (class 0 OID 0)
-- Dependencies: 956
-- Name: FUNCTION distance_sphere(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.distance_sphere(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 5938 (class 0 OID 0)
-- Dependencies: 957
-- Name: FUNCTION distance_spheroid(public.geometry, public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.distance_spheroid(public.geometry, public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 5939 (class 0 OID 0)
-- Dependencies: 885
-- Name: FUNCTION dropbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropbbox(public.geometry) TO coptool;


--
-- TOC entry 5940 (class 0 OID 0)
-- Dependencies: 1166
-- Name: FUNCTION dropgeometrycolumn(table_name character varying, column_name character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropgeometrycolumn(table_name character varying, column_name character varying) TO coptool;


--
-- TOC entry 5941 (class 0 OID 0)
-- Dependencies: 1167
-- Name: FUNCTION dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropgeometrycolumn(schema_name character varying, table_name character varying, column_name character varying) TO coptool;


--
-- TOC entry 5942 (class 0 OID 0)
-- Dependencies: 1168
-- Name: FUNCTION dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropgeometrycolumn(catalog_name character varying, schema_name character varying, table_name character varying, column_name character varying) TO coptool;


--
-- TOC entry 5943 (class 0 OID 0)
-- Dependencies: 436
-- Name: FUNCTION dropgeometrytable(table_name character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropgeometrytable(table_name character varying) TO coptool;


--
-- TOC entry 5944 (class 0 OID 0)
-- Dependencies: 437
-- Name: FUNCTION dropgeometrytable(schema_name character varying, table_name character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropgeometrytable(schema_name character varying, table_name character varying) TO coptool;


--
-- TOC entry 5945 (class 0 OID 0)
-- Dependencies: 438
-- Name: FUNCTION dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dropgeometrytable(catalog_name character varying, schema_name character varying, table_name character varying) TO coptool;


--
-- TOC entry 5946 (class 0 OID 0)
-- Dependencies: 1169
-- Name: FUNCTION dump(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dump(public.geometry) TO coptool;


--
-- TOC entry 5947 (class 0 OID 0)
-- Dependencies: 1170
-- Name: FUNCTION dumprings(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.dumprings(public.geometry) TO coptool;


--
-- TOC entry 5948 (class 0 OID 0)
-- Dependencies: 1171
-- Name: FUNCTION enablelongtransactions(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.enablelongtransactions() TO coptool;


--
-- TOC entry 5949 (class 0 OID 0)
-- Dependencies: 958
-- Name: FUNCTION endpoint(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.endpoint(public.geometry) TO coptool;


--
-- TOC entry 5950 (class 0 OID 0)
-- Dependencies: 959
-- Name: FUNCTION envelope(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.envelope(public.geometry) TO coptool;


--
-- TOC entry 5951 (class 0 OID 0)
-- Dependencies: 572
-- Name: FUNCTION equals(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.equals(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 5952 (class 0 OID 0)
-- Dependencies: 886
-- Name: FUNCTION estimated_extent(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.estimated_extent(text, text) TO coptool;


--
-- TOC entry 5953 (class 0 OID 0)
-- Dependencies: 1172
-- Name: FUNCTION estimated_extent(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.estimated_extent(text, text, text) TO coptool;


--
-- TOC entry 5954 (class 0 OID 0)
-- Dependencies: 960
-- Name: FUNCTION expand(public.box2d, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.expand(public.box2d, double precision) TO coptool;


--
-- TOC entry 5955 (class 0 OID 0)
-- Dependencies: 961
-- Name: FUNCTION expand(public.box3d, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.expand(public.box3d, double precision) TO coptool;


--
-- TOC entry 5956 (class 0 OID 0)
-- Dependencies: 1173
-- Name: FUNCTION expand(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.expand(public.geometry, double precision) TO coptool;


--
-- TOC entry 5957 (class 0 OID 0)
-- Dependencies: 962
-- Name: FUNCTION exteriorring(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.exteriorring(public.geometry) TO coptool;


--
-- TOC entry 5958 (class 0 OID 0)
-- Dependencies: 1174
-- Name: FUNCTION find_extent(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_extent(text, text) TO coptool;


--
-- TOC entry 5959 (class 0 OID 0)
-- Dependencies: 963
-- Name: FUNCTION find_extent(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_extent(text, text, text) TO coptool;


--
-- TOC entry 5960 (class 0 OID 0)
-- Dependencies: 439
-- Name: FUNCTION find_srid(character varying, character varying, character varying); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.find_srid(character varying, character varying, character varying) TO coptool;


--
-- TOC entry 5961 (class 0 OID 0)
-- Dependencies: 1175
-- Name: FUNCTION fix_geometry_columns(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.fix_geometry_columns() TO coptool;


--
-- TOC entry 5962 (class 0 OID 0)
-- Dependencies: 964
-- Name: FUNCTION force_2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.force_2d(public.geometry) TO coptool;


--
-- TOC entry 5963 (class 0 OID 0)
-- Dependencies: 965
-- Name: FUNCTION force_3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.force_3d(public.geometry) TO coptool;


--
-- TOC entry 5964 (class 0 OID 0)
-- Dependencies: 966
-- Name: FUNCTION force_3dm(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.force_3dm(public.geometry) TO coptool;


--
-- TOC entry 5965 (class 0 OID 0)
-- Dependencies: 967
-- Name: FUNCTION force_3dz(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.force_3dz(public.geometry) TO coptool;


--
-- TOC entry 5966 (class 0 OID 0)
-- Dependencies: 968
-- Name: FUNCTION force_4d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.force_4d(public.geometry) TO coptool;


--
-- TOC entry 5967 (class 0 OID 0)
-- Dependencies: 969
-- Name: FUNCTION force_collection(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.force_collection(public.geometry) TO coptool;


--
-- TOC entry 5968 (class 0 OID 0)
-- Dependencies: 970
-- Name: FUNCTION forcerhr(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.forcerhr(public.geometry) TO coptool;


--
-- TOC entry 5969 (class 0 OID 0)
-- Dependencies: 1176
-- Name: FUNCTION geog_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geog_brin_inclusion_add_value(internal, internal, internal, internal) TO coptool;


--
-- TOC entry 5970 (class 0 OID 0)
-- Dependencies: 688
-- Name: FUNCTION geography(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography(bytea) TO coptool;


--
-- TOC entry 5971 (class 0 OID 0)
-- Dependencies: 689
-- Name: FUNCTION geography(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography(public.geometry) TO coptool;


--
-- TOC entry 5972 (class 0 OID 0)
-- Dependencies: 690
-- Name: FUNCTION geography(public.geography, integer, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography(public.geography, integer, boolean) TO coptool;


--
-- TOC entry 5973 (class 0 OID 0)
-- Dependencies: 691
-- Name: FUNCTION geography_cmp(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_cmp(public.geography, public.geography) TO coptool;


--
-- TOC entry 5974 (class 0 OID 0)
-- Dependencies: 1177
-- Name: FUNCTION geography_distance_knn(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_distance_knn(public.geography, public.geography) TO coptool;


--
-- TOC entry 5975 (class 0 OID 0)
-- Dependencies: 692
-- Name: FUNCTION geography_eq(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_eq(public.geography, public.geography) TO coptool;


--
-- TOC entry 5976 (class 0 OID 0)
-- Dependencies: 693
-- Name: FUNCTION geography_ge(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_ge(public.geography, public.geography) TO coptool;


--
-- TOC entry 5977 (class 0 OID 0)
-- Dependencies: 694
-- Name: FUNCTION geography_gist_compress(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_compress(internal) TO coptool;


--
-- TOC entry 5978 (class 0 OID 0)
-- Dependencies: 1178
-- Name: FUNCTION geography_gist_consistent(internal, public.geography, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_consistent(internal, public.geography, integer) TO coptool;


--
-- TOC entry 5979 (class 0 OID 0)
-- Dependencies: 695
-- Name: FUNCTION geography_gist_decompress(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_decompress(internal) TO coptool;


--
-- TOC entry 5980 (class 0 OID 0)
-- Dependencies: 696
-- Name: FUNCTION geography_gist_distance(internal, public.geography, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_distance(internal, public.geography, integer) TO coptool;


--
-- TOC entry 5981 (class 0 OID 0)
-- Dependencies: 697
-- Name: FUNCTION geography_gist_penalty(internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_penalty(internal, internal, internal) TO coptool;


--
-- TOC entry 5982 (class 0 OID 0)
-- Dependencies: 698
-- Name: FUNCTION geography_gist_picksplit(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_picksplit(internal, internal) TO coptool;


--
-- TOC entry 5983 (class 0 OID 0)
-- Dependencies: 1163
-- Name: FUNCTION geography_gist_same(public.box2d, public.box2d, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_same(public.box2d, public.box2d, internal) TO coptool;


--
-- TOC entry 5984 (class 0 OID 0)
-- Dependencies: 699
-- Name: FUNCTION geography_gist_union(bytea, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gist_union(bytea, internal) TO coptool;


--
-- TOC entry 5985 (class 0 OID 0)
-- Dependencies: 700
-- Name: FUNCTION geography_gt(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_gt(public.geography, public.geography) TO coptool;


--
-- TOC entry 5986 (class 0 OID 0)
-- Dependencies: 701
-- Name: FUNCTION geography_le(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_le(public.geography, public.geography) TO coptool;


--
-- TOC entry 5987 (class 0 OID 0)
-- Dependencies: 702
-- Name: FUNCTION geography_lt(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_lt(public.geography, public.geography) TO coptool;


--
-- TOC entry 5988 (class 0 OID 0)
-- Dependencies: 1179
-- Name: FUNCTION geography_overlaps(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_overlaps(public.geography, public.geography) TO coptool;


--
-- TOC entry 5989 (class 0 OID 0)
-- Dependencies: 1180
-- Name: FUNCTION geography_spgist_choose_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_spgist_choose_nd(internal, internal) TO coptool;


--
-- TOC entry 5990 (class 0 OID 0)
-- Dependencies: 813
-- Name: FUNCTION geography_spgist_compress_nd(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_spgist_compress_nd(internal) TO coptool;


--
-- TOC entry 5991 (class 0 OID 0)
-- Dependencies: 814
-- Name: FUNCTION geography_spgist_config_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_spgist_config_nd(internal, internal) TO coptool;


--
-- TOC entry 5992 (class 0 OID 0)
-- Dependencies: 1181
-- Name: FUNCTION geography_spgist_inner_consistent_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_spgist_inner_consistent_nd(internal, internal) TO coptool;


--
-- TOC entry 5993 (class 0 OID 0)
-- Dependencies: 815
-- Name: FUNCTION geography_spgist_leaf_consistent_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_spgist_leaf_consistent_nd(internal, internal) TO coptool;


--
-- TOC entry 5994 (class 0 OID 0)
-- Dependencies: 816
-- Name: FUNCTION geography_spgist_picksplit_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geography_spgist_picksplit_nd(internal, internal) TO coptool;


--
-- TOC entry 5995 (class 0 OID 0)
-- Dependencies: 790
-- Name: FUNCTION geom2d_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geom2d_brin_inclusion_add_value(internal, internal, internal, internal) TO coptool;


--
-- TOC entry 5996 (class 0 OID 0)
-- Dependencies: 791
-- Name: FUNCTION geom3d_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geom3d_brin_inclusion_add_value(internal, internal, internal, internal) TO coptool;


--
-- TOC entry 5997 (class 0 OID 0)
-- Dependencies: 792
-- Name: FUNCTION geom4d_brin_inclusion_add_value(internal, internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geom4d_brin_inclusion_add_value(internal, internal, internal, internal) TO coptool;


--
-- TOC entry 5998 (class 0 OID 0)
-- Dependencies: 1182
-- Name: FUNCTION geomcollfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomcollfromtext(text) TO coptool;


--
-- TOC entry 5999 (class 0 OID 0)
-- Dependencies: 971
-- Name: FUNCTION geomcollfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomcollfromtext(text, integer) TO coptool;


--
-- TOC entry 6000 (class 0 OID 0)
-- Dependencies: 972
-- Name: FUNCTION geomcollfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomcollfromwkb(bytea) TO coptool;


--
-- TOC entry 6001 (class 0 OID 0)
-- Dependencies: 973
-- Name: FUNCTION geomcollfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomcollfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6002 (class 0 OID 0)
-- Dependencies: 469
-- Name: FUNCTION geometry(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(bytea) TO coptool;


--
-- TOC entry 6003 (class 0 OID 0)
-- Dependencies: 318
-- Name: FUNCTION geometry(path); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(path) TO coptool;


--
-- TOC entry 6004 (class 0 OID 0)
-- Dependencies: 319
-- Name: FUNCTION geometry(point); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(point) TO coptool;


--
-- TOC entry 6005 (class 0 OID 0)
-- Dependencies: 1183
-- Name: FUNCTION geometry(polygon); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(polygon) TO coptool;


--
-- TOC entry 6006 (class 0 OID 0)
-- Dependencies: 470
-- Name: FUNCTION geometry(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(text) TO coptool;


--
-- TOC entry 6007 (class 0 OID 0)
-- Dependencies: 1184
-- Name: FUNCTION geometry(public.box2d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(public.box2d) TO coptool;


--
-- TOC entry 6008 (class 0 OID 0)
-- Dependencies: 471
-- Name: FUNCTION geometry(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(public.box3d) TO coptool;


--
-- TOC entry 6009 (class 0 OID 0)
-- Dependencies: 703
-- Name: FUNCTION geometry(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(public.geography) TO coptool;


--
-- TOC entry 6010 (class 0 OID 0)
-- Dependencies: 320
-- Name: FUNCTION geometry(public.geometry, integer, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry(public.geometry, integer, boolean) TO coptool;


--
-- TOC entry 6011 (class 0 OID 0)
-- Dependencies: 1185
-- Name: FUNCTION geometry_above(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_above(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6012 (class 0 OID 0)
-- Dependencies: 1186
-- Name: FUNCTION geometry_below(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_below(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6013 (class 0 OID 0)
-- Dependencies: 1187
-- Name: FUNCTION geometry_cmp(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_cmp(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6014 (class 0 OID 0)
-- Dependencies: 793
-- Name: FUNCTION geometry_contained_3d(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_contained_3d(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6015 (class 0 OID 0)
-- Dependencies: 1188
-- Name: FUNCTION geometry_contains(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_contains(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6016 (class 0 OID 0)
-- Dependencies: 794
-- Name: FUNCTION geometry_contains_3d(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_contains_3d(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6017 (class 0 OID 0)
-- Dependencies: 1189
-- Name: FUNCTION geometry_contains_nd(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_contains_nd(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6018 (class 0 OID 0)
-- Dependencies: 1190
-- Name: FUNCTION geometry_distance_box(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_distance_box(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6019 (class 0 OID 0)
-- Dependencies: 1191
-- Name: FUNCTION geometry_distance_centroid(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_distance_centroid(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6020 (class 0 OID 0)
-- Dependencies: 1192
-- Name: FUNCTION geometry_distance_centroid_nd(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_distance_centroid_nd(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6021 (class 0 OID 0)
-- Dependencies: 327
-- Name: FUNCTION geometry_distance_cpa(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_distance_cpa(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6022 (class 0 OID 0)
-- Dependencies: 1193
-- Name: FUNCTION geometry_eq(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_eq(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6023 (class 0 OID 0)
-- Dependencies: 1194
-- Name: FUNCTION geometry_ge(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_ge(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6024 (class 0 OID 0)
-- Dependencies: 1195
-- Name: FUNCTION geometry_gist_compress_2d(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_compress_2d(internal) TO coptool;


--
-- TOC entry 6025 (class 0 OID 0)
-- Dependencies: 295
-- Name: FUNCTION geometry_gist_compress_nd(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_compress_nd(internal) TO coptool;


--
-- TOC entry 6026 (class 0 OID 0)
-- Dependencies: 1196
-- Name: FUNCTION geometry_gist_consistent_2d(internal, public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_consistent_2d(internal, public.geometry, integer) TO coptool;


--
-- TOC entry 6027 (class 0 OID 0)
-- Dependencies: 296
-- Name: FUNCTION geometry_gist_consistent_nd(internal, public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_consistent_nd(internal, public.geometry, integer) TO coptool;


--
-- TOC entry 6028 (class 0 OID 0)
-- Dependencies: 1197
-- Name: FUNCTION geometry_gist_decompress_2d(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_decompress_2d(internal) TO coptool;


--
-- TOC entry 6029 (class 0 OID 0)
-- Dependencies: 1198
-- Name: FUNCTION geometry_gist_decompress_nd(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_decompress_nd(internal) TO coptool;


--
-- TOC entry 6030 (class 0 OID 0)
-- Dependencies: 1199
-- Name: FUNCTION geometry_gist_distance_2d(internal, public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_distance_2d(internal, public.geometry, integer) TO coptool;


--
-- TOC entry 6031 (class 0 OID 0)
-- Dependencies: 1200
-- Name: FUNCTION geometry_gist_distance_nd(internal, public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_distance_nd(internal, public.geometry, integer) TO coptool;


--
-- TOC entry 6032 (class 0 OID 0)
-- Dependencies: 1201
-- Name: FUNCTION geometry_gist_penalty_2d(internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_penalty_2d(internal, internal, internal) TO coptool;


--
-- TOC entry 6033 (class 0 OID 0)
-- Dependencies: 1202
-- Name: FUNCTION geometry_gist_penalty_nd(internal, internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_penalty_nd(internal, internal, internal) TO coptool;


--
-- TOC entry 6034 (class 0 OID 0)
-- Dependencies: 1203
-- Name: FUNCTION geometry_gist_picksplit_2d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_picksplit_2d(internal, internal) TO coptool;


--
-- TOC entry 6035 (class 0 OID 0)
-- Dependencies: 1204
-- Name: FUNCTION geometry_gist_picksplit_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_picksplit_nd(internal, internal) TO coptool;


--
-- TOC entry 6036 (class 0 OID 0)
-- Dependencies: 1205
-- Name: FUNCTION geometry_gist_same_2d(geom1 public.geometry, geom2 public.geometry, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_same_2d(geom1 public.geometry, geom2 public.geometry, internal) TO coptool;


--
-- TOC entry 6037 (class 0 OID 0)
-- Dependencies: 1206
-- Name: FUNCTION geometry_gist_same_nd(public.geometry, public.geometry, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_same_nd(public.geometry, public.geometry, internal) TO coptool;


--
-- TOC entry 6038 (class 0 OID 0)
-- Dependencies: 287
-- Name: FUNCTION geometry_gist_union_2d(bytea, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_union_2d(bytea, internal) TO coptool;


--
-- TOC entry 6039 (class 0 OID 0)
-- Dependencies: 1207
-- Name: FUNCTION geometry_gist_union_nd(bytea, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gist_union_nd(bytea, internal) TO coptool;


--
-- TOC entry 6040 (class 0 OID 0)
-- Dependencies: 1208
-- Name: FUNCTION geometry_gt(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_gt(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6041 (class 0 OID 0)
-- Dependencies: 286
-- Name: FUNCTION geometry_hash(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_hash(public.geometry) TO coptool;


--
-- TOC entry 6042 (class 0 OID 0)
-- Dependencies: 285
-- Name: FUNCTION geometry_le(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_le(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6043 (class 0 OID 0)
-- Dependencies: 1209
-- Name: FUNCTION geometry_left(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_left(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6044 (class 0 OID 0)
-- Dependencies: 1210
-- Name: FUNCTION geometry_lt(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_lt(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6045 (class 0 OID 0)
-- Dependencies: 1211
-- Name: FUNCTION geometry_overabove(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overabove(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6046 (class 0 OID 0)
-- Dependencies: 292
-- Name: FUNCTION geometry_overbelow(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overbelow(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6047 (class 0 OID 0)
-- Dependencies: 1212
-- Name: FUNCTION geometry_overlaps(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overlaps(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6048 (class 0 OID 0)
-- Dependencies: 795
-- Name: FUNCTION geometry_overlaps_3d(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overlaps_3d(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6049 (class 0 OID 0)
-- Dependencies: 1213
-- Name: FUNCTION geometry_overlaps_nd(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overlaps_nd(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6050 (class 0 OID 0)
-- Dependencies: 1214
-- Name: FUNCTION geometry_overleft(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overleft(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6051 (class 0 OID 0)
-- Dependencies: 1215
-- Name: FUNCTION geometry_overright(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_overright(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6052 (class 0 OID 0)
-- Dependencies: 293
-- Name: FUNCTION geometry_right(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_right(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6053 (class 0 OID 0)
-- Dependencies: 290
-- Name: FUNCTION geometry_same(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_same(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6054 (class 0 OID 0)
-- Dependencies: 796
-- Name: FUNCTION geometry_same_3d(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_same_3d(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6055 (class 0 OID 0)
-- Dependencies: 1216
-- Name: FUNCTION geometry_same_nd(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_same_nd(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6056 (class 0 OID 0)
-- Dependencies: 1217
-- Name: FUNCTION geometry_sortsupport(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_sortsupport(internal) TO coptool;


--
-- TOC entry 6057 (class 0 OID 0)
-- Dependencies: 797
-- Name: FUNCTION geometry_spgist_choose_2d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_choose_2d(internal, internal) TO coptool;


--
-- TOC entry 6058 (class 0 OID 0)
-- Dependencies: 798
-- Name: FUNCTION geometry_spgist_choose_3d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_choose_3d(internal, internal) TO coptool;


--
-- TOC entry 6059 (class 0 OID 0)
-- Dependencies: 817
-- Name: FUNCTION geometry_spgist_choose_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_choose_nd(internal, internal) TO coptool;


--
-- TOC entry 6060 (class 0 OID 0)
-- Dependencies: 799
-- Name: FUNCTION geometry_spgist_compress_2d(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_compress_2d(internal) TO coptool;


--
-- TOC entry 6061 (class 0 OID 0)
-- Dependencies: 718
-- Name: FUNCTION geometry_spgist_compress_3d(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_compress_3d(internal) TO coptool;


--
-- TOC entry 6062 (class 0 OID 0)
-- Dependencies: 818
-- Name: FUNCTION geometry_spgist_compress_nd(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_compress_nd(internal) TO coptool;


--
-- TOC entry 6063 (class 0 OID 0)
-- Dependencies: 800
-- Name: FUNCTION geometry_spgist_config_2d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_config_2d(internal, internal) TO coptool;


--
-- TOC entry 6064 (class 0 OID 0)
-- Dependencies: 801
-- Name: FUNCTION geometry_spgist_config_3d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_config_3d(internal, internal) TO coptool;


--
-- TOC entry 6065 (class 0 OID 0)
-- Dependencies: 1218
-- Name: FUNCTION geometry_spgist_config_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_config_nd(internal, internal) TO coptool;


--
-- TOC entry 6066 (class 0 OID 0)
-- Dependencies: 802
-- Name: FUNCTION geometry_spgist_inner_consistent_2d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_inner_consistent_2d(internal, internal) TO coptool;


--
-- TOC entry 6067 (class 0 OID 0)
-- Dependencies: 803
-- Name: FUNCTION geometry_spgist_inner_consistent_3d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_inner_consistent_3d(internal, internal) TO coptool;


--
-- TOC entry 6068 (class 0 OID 0)
-- Dependencies: 819
-- Name: FUNCTION geometry_spgist_inner_consistent_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_inner_consistent_nd(internal, internal) TO coptool;


--
-- TOC entry 6069 (class 0 OID 0)
-- Dependencies: 804
-- Name: FUNCTION geometry_spgist_leaf_consistent_2d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_leaf_consistent_2d(internal, internal) TO coptool;


--
-- TOC entry 6070 (class 0 OID 0)
-- Dependencies: 805
-- Name: FUNCTION geometry_spgist_leaf_consistent_3d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_leaf_consistent_3d(internal, internal) TO coptool;


--
-- TOC entry 6071 (class 0 OID 0)
-- Dependencies: 820
-- Name: FUNCTION geometry_spgist_leaf_consistent_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_leaf_consistent_nd(internal, internal) TO coptool;


--
-- TOC entry 6072 (class 0 OID 0)
-- Dependencies: 806
-- Name: FUNCTION geometry_spgist_picksplit_2d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_picksplit_2d(internal, internal) TO coptool;


--
-- TOC entry 6073 (class 0 OID 0)
-- Dependencies: 807
-- Name: FUNCTION geometry_spgist_picksplit_3d(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_picksplit_3d(internal, internal) TO coptool;


--
-- TOC entry 6074 (class 0 OID 0)
-- Dependencies: 821
-- Name: FUNCTION geometry_spgist_picksplit_nd(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_spgist_picksplit_nd(internal, internal) TO coptool;


--
-- TOC entry 6075 (class 0 OID 0)
-- Dependencies: 291
-- Name: FUNCTION geometry_within(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_within(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6076 (class 0 OID 0)
-- Dependencies: 294
-- Name: FUNCTION geometry_within_nd(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometry_within_nd(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6077 (class 0 OID 0)
-- Dependencies: 887
-- Name: FUNCTION geometryfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometryfromtext(text) TO coptool;


--
-- TOC entry 6078 (class 0 OID 0)
-- Dependencies: 888
-- Name: FUNCTION geometryfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometryfromtext(text, integer) TO coptool;


--
-- TOC entry 6079 (class 0 OID 0)
-- Dependencies: 974
-- Name: FUNCTION geometryn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometryn(public.geometry, integer) TO coptool;


--
-- TOC entry 6080 (class 0 OID 0)
-- Dependencies: 732
-- Name: FUNCTION geometrytype(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometrytype(public.geography) TO coptool;


--
-- TOC entry 6081 (class 0 OID 0)
-- Dependencies: 607
-- Name: FUNCTION geometrytype(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geometrytype(public.geometry) TO coptool;


--
-- TOC entry 6082 (class 0 OID 0)
-- Dependencies: 1219
-- Name: FUNCTION geomfromewkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomfromewkb(bytea) TO coptool;


--
-- TOC entry 6083 (class 0 OID 0)
-- Dependencies: 395
-- Name: FUNCTION geomfromewkt(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomfromewkt(text) TO coptool;


--
-- TOC entry 6084 (class 0 OID 0)
-- Dependencies: 889
-- Name: FUNCTION geomfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomfromtext(text) TO coptool;


--
-- TOC entry 6085 (class 0 OID 0)
-- Dependencies: 890
-- Name: FUNCTION geomfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomfromtext(text, integer) TO coptool;


--
-- TOC entry 6086 (class 0 OID 0)
-- Dependencies: 1220
-- Name: FUNCTION geomfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomfromwkb(bytea) TO coptool;


--
-- TOC entry 6087 (class 0 OID 0)
-- Dependencies: 891
-- Name: FUNCTION geomfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6088 (class 0 OID 0)
-- Dependencies: 975
-- Name: FUNCTION geomunion(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.geomunion(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6089 (class 0 OID 0)
-- Dependencies: 440
-- Name: FUNCTION get_proj4_from_srid(integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.get_proj4_from_srid(integer) TO coptool;


--
-- TOC entry 6090 (class 0 OID 0)
-- Dependencies: 976
-- Name: FUNCTION getbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.getbbox(public.geometry) TO coptool;


--
-- TOC entry 6091 (class 0 OID 0)
-- Dependencies: 892
-- Name: FUNCTION getsrid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.getsrid(public.geometry) TO coptool;


--
-- TOC entry 6092 (class 0 OID 0)
-- Dependencies: 680
-- Name: FUNCTION gettransactionid(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gettransactionid() TO coptool;


--
-- TOC entry 6093 (class 0 OID 0)
-- Dependencies: 1221
-- Name: FUNCTION gserialized_gist_joinsel_2d(internal, oid, internal, smallint); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gserialized_gist_joinsel_2d(internal, oid, internal, smallint) TO coptool;


--
-- TOC entry 6094 (class 0 OID 0)
-- Dependencies: 289
-- Name: FUNCTION gserialized_gist_joinsel_nd(internal, oid, internal, smallint); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gserialized_gist_joinsel_nd(internal, oid, internal, smallint) TO coptool;


--
-- TOC entry 6095 (class 0 OID 0)
-- Dependencies: 288
-- Name: FUNCTION gserialized_gist_sel_2d(internal, oid, internal, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gserialized_gist_sel_2d(internal, oid, internal, integer) TO coptool;


--
-- TOC entry 6096 (class 0 OID 0)
-- Dependencies: 1222
-- Name: FUNCTION gserialized_gist_sel_nd(internal, oid, internal, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.gserialized_gist_sel_nd(internal, oid, internal, integer) TO coptool;


--
-- TOC entry 6097 (class 0 OID 0)
-- Dependencies: 893
-- Name: FUNCTION hasbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.hasbbox(public.geometry) TO coptool;


--
-- TOC entry 6098 (class 0 OID 0)
-- Dependencies: 1223
-- Name: FUNCTION interiorringn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.interiorringn(public.geometry, integer) TO coptool;


--
-- TOC entry 6099 (class 0 OID 0)
-- Dependencies: 984
-- Name: FUNCTION intersection(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.intersection(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6100 (class 0 OID 0)
-- Dependencies: 1224
-- Name: FUNCTION intersects(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.intersects(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6101 (class 0 OID 0)
-- Dependencies: 771
-- Name: FUNCTION is_contained_2d(public.box2df, public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.is_contained_2d(public.box2df, public.box2df) TO coptool;


--
-- TOC entry 6102 (class 0 OID 0)
-- Dependencies: 772
-- Name: FUNCTION is_contained_2d(public.box2df, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.is_contained_2d(public.box2df, public.geometry) TO coptool;


--
-- TOC entry 6103 (class 0 OID 0)
-- Dependencies: 773
-- Name: FUNCTION is_contained_2d(public.geometry, public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.is_contained_2d(public.geometry, public.box2df) TO coptool;


--
-- TOC entry 6104 (class 0 OID 0)
-- Dependencies: 985
-- Name: FUNCTION isclosed(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.isclosed(public.geometry) TO coptool;


--
-- TOC entry 6105 (class 0 OID 0)
-- Dependencies: 1225
-- Name: FUNCTION isempty(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.isempty(public.geometry) TO coptool;


--
-- TOC entry 6106 (class 0 OID 0)
-- Dependencies: 977
-- Name: FUNCTION isring(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.isring(public.geometry) TO coptool;


--
-- TOC entry 6107 (class 0 OID 0)
-- Dependencies: 978
-- Name: FUNCTION issimple(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.issimple(public.geometry) TO coptool;


--
-- TOC entry 6108 (class 0 OID 0)
-- Dependencies: 986
-- Name: FUNCTION isvalid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.isvalid(public.geometry) TO coptool;


--
-- TOC entry 6109 (class 0 OID 0)
-- Dependencies: 592
-- Name: FUNCTION json(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.json(public.geometry) TO coptool;


--
-- TOC entry 6110 (class 0 OID 0)
-- Dependencies: 1226
-- Name: FUNCTION jsonb(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.jsonb(public.geometry) TO coptool;


--
-- TOC entry 6111 (class 0 OID 0)
-- Dependencies: 987
-- Name: FUNCTION length(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.length(public.geometry) TO coptool;


--
-- TOC entry 6112 (class 0 OID 0)
-- Dependencies: 988
-- Name: FUNCTION length2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.length2d(public.geometry) TO coptool;


--
-- TOC entry 6113 (class 0 OID 0)
-- Dependencies: 979
-- Name: FUNCTION length2d_spheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.length2d_spheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6114 (class 0 OID 0)
-- Dependencies: 1227
-- Name: FUNCTION length3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.length3d(public.geometry) TO coptool;


--
-- TOC entry 6115 (class 0 OID 0)
-- Dependencies: 1228
-- Name: FUNCTION length3d_spheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.length3d_spheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6116 (class 0 OID 0)
-- Dependencies: 980
-- Name: FUNCTION length_spheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.length_spheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6117 (class 0 OID 0)
-- Dependencies: 989
-- Name: FUNCTION line_interpolate_point(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.line_interpolate_point(public.geometry, double precision) TO coptool;


--
-- TOC entry 6118 (class 0 OID 0)
-- Dependencies: 990
-- Name: FUNCTION line_locate_point(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.line_locate_point(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6119 (class 0 OID 0)
-- Dependencies: 991
-- Name: FUNCTION line_substring(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.line_substring(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6120 (class 0 OID 0)
-- Dependencies: 992
-- Name: FUNCTION linefrommultipoint(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linefrommultipoint(public.geometry) TO coptool;


--
-- TOC entry 6121 (class 0 OID 0)
-- Dependencies: 1229
-- Name: FUNCTION linefromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linefromtext(text) TO coptool;


--
-- TOC entry 6122 (class 0 OID 0)
-- Dependencies: 993
-- Name: FUNCTION linefromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linefromtext(text, integer) TO coptool;


--
-- TOC entry 6123 (class 0 OID 0)
-- Dependencies: 994
-- Name: FUNCTION linefromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linefromwkb(bytea) TO coptool;


--
-- TOC entry 6124 (class 0 OID 0)
-- Dependencies: 995
-- Name: FUNCTION linefromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linefromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6125 (class 0 OID 0)
-- Dependencies: 981
-- Name: FUNCTION linemerge(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linemerge(public.geometry) TO coptool;


--
-- TOC entry 6126 (class 0 OID 0)
-- Dependencies: 996
-- Name: FUNCTION linestringfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linestringfromtext(text) TO coptool;


--
-- TOC entry 6127 (class 0 OID 0)
-- Dependencies: 1230
-- Name: FUNCTION linestringfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linestringfromtext(text, integer) TO coptool;


--
-- TOC entry 6128 (class 0 OID 0)
-- Dependencies: 997
-- Name: FUNCTION linestringfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linestringfromwkb(bytea) TO coptool;


--
-- TOC entry 6129 (class 0 OID 0)
-- Dependencies: 998
-- Name: FUNCTION linestringfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.linestringfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6130 (class 0 OID 0)
-- Dependencies: 982
-- Name: FUNCTION locate_along_measure(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.locate_along_measure(public.geometry, double precision) TO coptool;


--
-- TOC entry 6131 (class 0 OID 0)
-- Dependencies: 999
-- Name: FUNCTION locate_between_measures(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.locate_between_measures(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6132 (class 0 OID 0)
-- Dependencies: 681
-- Name: FUNCTION lockrow(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.lockrow(text, text, text) TO coptool;


--
-- TOC entry 6133 (class 0 OID 0)
-- Dependencies: 682
-- Name: FUNCTION lockrow(text, text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.lockrow(text, text, text, text) TO coptool;


--
-- TOC entry 6134 (class 0 OID 0)
-- Dependencies: 683
-- Name: FUNCTION lockrow(text, text, text, timestamp without time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.lockrow(text, text, text, timestamp without time zone) TO coptool;


--
-- TOC entry 6135 (class 0 OID 0)
-- Dependencies: 1233
-- Name: FUNCTION lockrow(text, text, text, text, timestamp without time zone); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.lockrow(text, text, text, text, timestamp without time zone) TO coptool;


--
-- TOC entry 6136 (class 0 OID 0)
-- Dependencies: 684
-- Name: FUNCTION longtransactionsenabled(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.longtransactionsenabled() TO coptool;


--
-- TOC entry 6137 (class 0 OID 0)
-- Dependencies: 1000
-- Name: FUNCTION m(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.m(public.geometry) TO coptool;


--
-- TOC entry 6138 (class 0 OID 0)
-- Dependencies: 983
-- Name: FUNCTION makebox2d(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makebox2d(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6139 (class 0 OID 0)
-- Dependencies: 1234
-- Name: FUNCTION makebox3d(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makebox3d(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6140 (class 0 OID 0)
-- Dependencies: 1001
-- Name: FUNCTION makeline(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makeline(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6141 (class 0 OID 0)
-- Dependencies: 1002
-- Name: FUNCTION makeline_garray(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makeline_garray(public.geometry[]) TO coptool;


--
-- TOC entry 6142 (class 0 OID 0)
-- Dependencies: 1003
-- Name: FUNCTION makepoint(double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makepoint(double precision, double precision) TO coptool;


--
-- TOC entry 6143 (class 0 OID 0)
-- Dependencies: 1235
-- Name: FUNCTION makepoint(double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makepoint(double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6144 (class 0 OID 0)
-- Dependencies: 1236
-- Name: FUNCTION makepoint(double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makepoint(double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6145 (class 0 OID 0)
-- Dependencies: 1011
-- Name: FUNCTION makepointm(double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makepointm(double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6146 (class 0 OID 0)
-- Dependencies: 1004
-- Name: FUNCTION makepolygon(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makepolygon(public.geometry) TO coptool;


--
-- TOC entry 6147 (class 0 OID 0)
-- Dependencies: 1005
-- Name: FUNCTION makepolygon(public.geometry, public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makepolygon(public.geometry, public.geometry[]) TO coptool;


--
-- TOC entry 6148 (class 0 OID 0)
-- Dependencies: 1237
-- Name: FUNCTION max_distance(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.max_distance(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6149 (class 0 OID 0)
-- Dependencies: 1012
-- Name: FUNCTION mem_size(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mem_size(public.geometry) TO coptool;


--
-- TOC entry 6150 (class 0 OID 0)
-- Dependencies: 1013
-- Name: FUNCTION mlinefromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mlinefromtext(text) TO coptool;


--
-- TOC entry 6151 (class 0 OID 0)
-- Dependencies: 1014
-- Name: FUNCTION mlinefromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mlinefromtext(text, integer) TO coptool;


--
-- TOC entry 6152 (class 0 OID 0)
-- Dependencies: 1238
-- Name: FUNCTION mlinefromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mlinefromwkb(bytea) TO coptool;


--
-- TOC entry 6153 (class 0 OID 0)
-- Dependencies: 1015
-- Name: FUNCTION mlinefromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mlinefromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6154 (class 0 OID 0)
-- Dependencies: 1016
-- Name: FUNCTION mpointfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpointfromtext(text) TO coptool;


--
-- TOC entry 6155 (class 0 OID 0)
-- Dependencies: 1017
-- Name: FUNCTION mpointfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpointfromtext(text, integer) TO coptool;


--
-- TOC entry 6156 (class 0 OID 0)
-- Dependencies: 1018
-- Name: FUNCTION mpointfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpointfromwkb(bytea) TO coptool;


--
-- TOC entry 6157 (class 0 OID 0)
-- Dependencies: 1239
-- Name: FUNCTION mpointfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpointfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6158 (class 0 OID 0)
-- Dependencies: 1019
-- Name: FUNCTION mpolyfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpolyfromtext(text) TO coptool;


--
-- TOC entry 6159 (class 0 OID 0)
-- Dependencies: 1020
-- Name: FUNCTION mpolyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpolyfromtext(text, integer) TO coptool;


--
-- TOC entry 6160 (class 0 OID 0)
-- Dependencies: 1006
-- Name: FUNCTION mpolyfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpolyfromwkb(bytea) TO coptool;


--
-- TOC entry 6161 (class 0 OID 0)
-- Dependencies: 1021
-- Name: FUNCTION mpolyfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.mpolyfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6162 (class 0 OID 0)
-- Dependencies: 1007
-- Name: FUNCTION multi(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multi(public.geometry) TO coptool;


--
-- TOC entry 6163 (class 0 OID 0)
-- Dependencies: 1022
-- Name: FUNCTION multilinefromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multilinefromwkb(bytea) TO coptool;


--
-- TOC entry 6164 (class 0 OID 0)
-- Dependencies: 1023
-- Name: FUNCTION multilinefromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multilinefromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6165 (class 0 OID 0)
-- Dependencies: 1009
-- Name: FUNCTION multilinestringfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multilinestringfromtext(text) TO coptool;


--
-- TOC entry 6166 (class 0 OID 0)
-- Dependencies: 1240
-- Name: FUNCTION multilinestringfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multilinestringfromtext(text, integer) TO coptool;


--
-- TOC entry 6167 (class 0 OID 0)
-- Dependencies: 1024
-- Name: FUNCTION multipointfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipointfromtext(text) TO coptool;


--
-- TOC entry 6168 (class 0 OID 0)
-- Dependencies: 1010
-- Name: FUNCTION multipointfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipointfromtext(text, integer) TO coptool;


--
-- TOC entry 6169 (class 0 OID 0)
-- Dependencies: 1025
-- Name: FUNCTION multipointfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipointfromwkb(bytea) TO coptool;


--
-- TOC entry 6170 (class 0 OID 0)
-- Dependencies: 1241
-- Name: FUNCTION multipointfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipointfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6171 (class 0 OID 0)
-- Dependencies: 1242
-- Name: FUNCTION multipolyfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipolyfromwkb(bytea) TO coptool;


--
-- TOC entry 6172 (class 0 OID 0)
-- Dependencies: 1008
-- Name: FUNCTION multipolyfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipolyfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6173 (class 0 OID 0)
-- Dependencies: 1026
-- Name: FUNCTION multipolygonfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipolygonfromtext(text) TO coptool;


--
-- TOC entry 6174 (class 0 OID 0)
-- Dependencies: 1027
-- Name: FUNCTION multipolygonfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.multipolygonfromtext(text, integer) TO coptool;


--
-- TOC entry 6175 (class 0 OID 0)
-- Dependencies: 894
-- Name: FUNCTION ndims(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.ndims(public.geometry) TO coptool;


--
-- TOC entry 6176 (class 0 OID 0)
-- Dependencies: 1243
-- Name: FUNCTION noop(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.noop(public.geometry) TO coptool;


--
-- TOC entry 6177 (class 0 OID 0)
-- Dependencies: 1244
-- Name: FUNCTION npoints(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.npoints(public.geometry) TO coptool;


--
-- TOC entry 6178 (class 0 OID 0)
-- Dependencies: 1245
-- Name: FUNCTION nrings(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.nrings(public.geometry) TO coptool;


--
-- TOC entry 6179 (class 0 OID 0)
-- Dependencies: 1246
-- Name: FUNCTION numgeometries(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.numgeometries(public.geometry) TO coptool;


--
-- TOC entry 6180 (class 0 OID 0)
-- Dependencies: 1028
-- Name: FUNCTION numinteriorring(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.numinteriorring(public.geometry) TO coptool;


--
-- TOC entry 6181 (class 0 OID 0)
-- Dependencies: 1029
-- Name: FUNCTION numinteriorrings(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.numinteriorrings(public.geometry) TO coptool;


--
-- TOC entry 6182 (class 0 OID 0)
-- Dependencies: 1030
-- Name: FUNCTION numpoints(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.numpoints(public.geometry) TO coptool;


--
-- TOC entry 6183 (class 0 OID 0)
-- Dependencies: 1247
-- Name: FUNCTION other_substance_code_update(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.other_substance_code_update() TO coptool;


--
-- TOC entry 6184 (class 0 OID 0)
-- Dependencies: 1248
-- Name: FUNCTION "overlaps"(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public."overlaps"(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6185 (class 0 OID 0)
-- Dependencies: 1249
-- Name: FUNCTION overlaps_2d(public.box2df, public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_2d(public.box2df, public.box2df) TO coptool;


--
-- TOC entry 6186 (class 0 OID 0)
-- Dependencies: 774
-- Name: FUNCTION overlaps_2d(public.box2df, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_2d(public.box2df, public.geometry) TO coptool;


--
-- TOC entry 6187 (class 0 OID 0)
-- Dependencies: 775
-- Name: FUNCTION overlaps_2d(public.geometry, public.box2df); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_2d(public.geometry, public.box2df) TO coptool;


--
-- TOC entry 6188 (class 0 OID 0)
-- Dependencies: 704
-- Name: FUNCTION overlaps_geog(public.geography, public.gidx); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_geog(public.geography, public.gidx) TO coptool;


--
-- TOC entry 6189 (class 0 OID 0)
-- Dependencies: 705
-- Name: FUNCTION overlaps_geog(public.gidx, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_geog(public.gidx, public.geography) TO coptool;


--
-- TOC entry 6190 (class 0 OID 0)
-- Dependencies: 1250
-- Name: FUNCTION overlaps_geog(public.gidx, public.gidx); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_geog(public.gidx, public.gidx) TO coptool;


--
-- TOC entry 6191 (class 0 OID 0)
-- Dependencies: 808
-- Name: FUNCTION overlaps_nd(public.geometry, public.gidx); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_nd(public.geometry, public.gidx) TO coptool;


--
-- TOC entry 6192 (class 0 OID 0)
-- Dependencies: 776
-- Name: FUNCTION overlaps_nd(public.gidx, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_nd(public.gidx, public.geometry) TO coptool;


--
-- TOC entry 6193 (class 0 OID 0)
-- Dependencies: 809
-- Name: FUNCTION overlaps_nd(public.gidx, public.gidx); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.overlaps_nd(public.gidx, public.gidx) TO coptool;


--
-- TOC entry 6194 (class 0 OID 0)
-- Dependencies: 321
-- Name: FUNCTION path(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.path(public.geometry) TO coptool;


--
-- TOC entry 6195 (class 0 OID 0)
-- Dependencies: 1251
-- Name: FUNCTION perimeter2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.perimeter2d(public.geometry) TO coptool;


--
-- TOC entry 6196 (class 0 OID 0)
-- Dependencies: 1252
-- Name: FUNCTION perimeter3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.perimeter3d(public.geometry) TO coptool;


--
-- TOC entry 6197 (class 0 OID 0)
-- Dependencies: 593
-- Name: FUNCTION pgis_asgeobuf_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asgeobuf_finalfn(internal) TO coptool;


--
-- TOC entry 6198 (class 0 OID 0)
-- Dependencies: 594
-- Name: FUNCTION pgis_asgeobuf_transfn(internal, anyelement); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement) TO coptool;


--
-- TOC entry 6199 (class 0 OID 0)
-- Dependencies: 595
-- Name: FUNCTION pgis_asgeobuf_transfn(internal, anyelement, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asgeobuf_transfn(internal, anyelement, text) TO coptool;


--
-- TOC entry 6200 (class 0 OID 0)
-- Dependencies: 1253
-- Name: FUNCTION pgis_asmvt_combinefn(internal, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_combinefn(internal, internal) TO coptool;


--
-- TOC entry 6201 (class 0 OID 0)
-- Dependencies: 596
-- Name: FUNCTION pgis_asmvt_deserialfn(bytea, internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_deserialfn(bytea, internal) TO coptool;


--
-- TOC entry 6202 (class 0 OID 0)
-- Dependencies: 597
-- Name: FUNCTION pgis_asmvt_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_finalfn(internal) TO coptool;


--
-- TOC entry 6203 (class 0 OID 0)
-- Dependencies: 598
-- Name: FUNCTION pgis_asmvt_serialfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_serialfn(internal) TO coptool;


--
-- TOC entry 6204 (class 0 OID 0)
-- Dependencies: 599
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement) TO coptool;


--
-- TOC entry 6205 (class 0 OID 0)
-- Dependencies: 1254
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text) TO coptool;


--
-- TOC entry 6206 (class 0 OID 0)
-- Dependencies: 600
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, integer) TO coptool;


--
-- TOC entry 6207 (class 0 OID 0)
-- Dependencies: 601
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text, integer, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, integer, text) TO coptool;


--
-- TOC entry 6208 (class 0 OID 0)
-- Dependencies: 602
-- Name: FUNCTION pgis_asmvt_transfn(internal, anyelement, text, integer, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_asmvt_transfn(internal, anyelement, text, integer, text, text) TO coptool;


--
-- TOC entry 6209 (class 0 OID 0)
-- Dependencies: 533
-- Name: FUNCTION pgis_geometry_accum_transfn(internal, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_accum_transfn(internal, public.geometry) TO coptool;


--
-- TOC entry 6210 (class 0 OID 0)
-- Dependencies: 534
-- Name: FUNCTION pgis_geometry_accum_transfn(internal, public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_accum_transfn(internal, public.geometry, double precision) TO coptool;


--
-- TOC entry 6211 (class 0 OID 0)
-- Dependencies: 1255
-- Name: FUNCTION pgis_geometry_accum_transfn(internal, public.geometry, double precision, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_accum_transfn(internal, public.geometry, double precision, integer) TO coptool;


--
-- TOC entry 6212 (class 0 OID 0)
-- Dependencies: 535
-- Name: FUNCTION pgis_geometry_clusterintersecting_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_clusterintersecting_finalfn(internal) TO coptool;


--
-- TOC entry 6213 (class 0 OID 0)
-- Dependencies: 536
-- Name: FUNCTION pgis_geometry_clusterwithin_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_clusterwithin_finalfn(internal) TO coptool;


--
-- TOC entry 6214 (class 0 OID 0)
-- Dependencies: 537
-- Name: FUNCTION pgis_geometry_collect_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_collect_finalfn(internal) TO coptool;


--
-- TOC entry 6215 (class 0 OID 0)
-- Dependencies: 538
-- Name: FUNCTION pgis_geometry_makeline_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_makeline_finalfn(internal) TO coptool;


--
-- TOC entry 6216 (class 0 OID 0)
-- Dependencies: 1231
-- Name: FUNCTION pgis_geometry_polygonize_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_polygonize_finalfn(internal) TO coptool;


--
-- TOC entry 6217 (class 0 OID 0)
-- Dependencies: 539
-- Name: FUNCTION pgis_geometry_union_finalfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pgis_geometry_union_finalfn(internal) TO coptool;


--
-- TOC entry 6218 (class 0 OID 0)
-- Dependencies: 322
-- Name: FUNCTION point(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.point(public.geometry) TO coptool;


--
-- TOC entry 6219 (class 0 OID 0)
-- Dependencies: 1031
-- Name: FUNCTION point_inside_circle(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.point_inside_circle(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6220 (class 0 OID 0)
-- Dependencies: 1032
-- Name: FUNCTION pointfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pointfromtext(text) TO coptool;


--
-- TOC entry 6221 (class 0 OID 0)
-- Dependencies: 1232
-- Name: FUNCTION pointfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pointfromtext(text, integer) TO coptool;


--
-- TOC entry 6222 (class 0 OID 0)
-- Dependencies: 1033
-- Name: FUNCTION pointfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pointfromwkb(bytea) TO coptool;


--
-- TOC entry 6223 (class 0 OID 0)
-- Dependencies: 1034
-- Name: FUNCTION pointfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pointfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6224 (class 0 OID 0)
-- Dependencies: 1035
-- Name: FUNCTION pointn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pointn(public.geometry, integer) TO coptool;


--
-- TOC entry 6225 (class 0 OID 0)
-- Dependencies: 1036
-- Name: FUNCTION pointonsurface(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.pointonsurface(public.geometry) TO coptool;


--
-- TOC entry 6226 (class 0 OID 0)
-- Dependencies: 1037
-- Name: FUNCTION polyfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polyfromtext(text) TO coptool;


--
-- TOC entry 6227 (class 0 OID 0)
-- Dependencies: 1256
-- Name: FUNCTION polyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polyfromtext(text, integer) TO coptool;


--
-- TOC entry 6228 (class 0 OID 0)
-- Dependencies: 1038
-- Name: FUNCTION polyfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polyfromwkb(bytea) TO coptool;


--
-- TOC entry 6229 (class 0 OID 0)
-- Dependencies: 1039
-- Name: FUNCTION polyfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polyfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6230 (class 0 OID 0)
-- Dependencies: 1257
-- Name: FUNCTION polygon(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polygon(public.geometry) TO coptool;


--
-- TOC entry 6231 (class 0 OID 0)
-- Dependencies: 1040
-- Name: FUNCTION polygonfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polygonfromtext(text) TO coptool;


--
-- TOC entry 6232 (class 0 OID 0)
-- Dependencies: 1041
-- Name: FUNCTION polygonfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polygonfromtext(text, integer) TO coptool;


--
-- TOC entry 6233 (class 0 OID 0)
-- Dependencies: 1042
-- Name: FUNCTION polygonfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polygonfromwkb(bytea) TO coptool;


--
-- TOC entry 6234 (class 0 OID 0)
-- Dependencies: 1258
-- Name: FUNCTION polygonfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polygonfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6235 (class 0 OID 0)
-- Dependencies: 1043
-- Name: FUNCTION polygonize_garray(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.polygonize_garray(public.geometry[]) TO coptool;


--
-- TOC entry 6236 (class 0 OID 0)
-- Dependencies: 1259
-- Name: FUNCTION populate_geometry_columns(use_typmod boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.populate_geometry_columns(use_typmod boolean) TO coptool;


--
-- TOC entry 6237 (class 0 OID 0)
-- Dependencies: 419
-- Name: FUNCTION populate_geometry_columns(tbl_oid oid, use_typmod boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.populate_geometry_columns(tbl_oid oid, use_typmod boolean) TO coptool;


--
-- TOC entry 6238 (class 0 OID 0)
-- Dependencies: 328
-- Name: FUNCTION postgis_addbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_addbbox(public.geometry) TO coptool;


--
-- TOC entry 6239 (class 0 OID 0)
-- Dependencies: 396
-- Name: FUNCTION postgis_cache_bbox(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_cache_bbox() TO coptool;


--
-- TOC entry 6240 (class 0 OID 0)
-- Dependencies: 753
-- Name: FUNCTION postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_constraint_dims(geomschema text, geomtable text, geomcolumn text) TO coptool;


--
-- TOC entry 6241 (class 0 OID 0)
-- Dependencies: 754
-- Name: FUNCTION postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_constraint_srid(geomschema text, geomtable text, geomcolumn text) TO coptool;


--
-- TOC entry 6242 (class 0 OID 0)
-- Dependencies: 1260
-- Name: FUNCTION postgis_constraint_type(geomschema text, geomtable text, geomcolumn text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_constraint_type(geomschema text, geomtable text, geomcolumn text) TO coptool;


--
-- TOC entry 6243 (class 0 OID 0)
-- Dependencies: 329
-- Name: FUNCTION postgis_dropbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_dropbbox(public.geometry) TO coptool;


--
-- TOC entry 6244 (class 0 OID 0)
-- Dependencies: 1261
-- Name: FUNCTION postgis_extensions_upgrade(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_extensions_upgrade() TO coptool;


--
-- TOC entry 6245 (class 0 OID 0)
-- Dependencies: 452
-- Name: FUNCTION postgis_full_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_full_version() TO coptool;


--
-- TOC entry 6246 (class 0 OID 0)
-- Dependencies: 1262
-- Name: FUNCTION postgis_geos_noop(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_geos_noop(public.geometry) TO coptool;


--
-- TOC entry 6247 (class 0 OID 0)
-- Dependencies: 453
-- Name: FUNCTION postgis_geos_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_geos_version() TO coptool;


--
-- TOC entry 6248 (class 0 OID 0)
-- Dependencies: 330
-- Name: FUNCTION postgis_getbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_getbbox(public.geometry) TO coptool;


--
-- TOC entry 6249 (class 0 OID 0)
-- Dependencies: 331
-- Name: FUNCTION postgis_hasbbox(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_hasbbox(public.geometry) TO coptool;


--
-- TOC entry 6250 (class 0 OID 0)
-- Dependencies: 555
-- Name: FUNCTION postgis_index_supportfn(internal); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_index_supportfn(internal) TO coptool;


--
-- TOC entry 6251 (class 0 OID 0)
-- Dependencies: 454
-- Name: FUNCTION postgis_lib_build_date(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_lib_build_date() TO coptool;


--
-- TOC entry 6252 (class 0 OID 0)
-- Dependencies: 455
-- Name: FUNCTION postgis_lib_revision(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_lib_revision() TO coptool;


--
-- TOC entry 6253 (class 0 OID 0)
-- Dependencies: 456
-- Name: FUNCTION postgis_lib_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_lib_version() TO coptool;


--
-- TOC entry 6254 (class 0 OID 0)
-- Dependencies: 573
-- Name: FUNCTION postgis_libjson_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_libjson_version() TO coptool;


--
-- TOC entry 6255 (class 0 OID 0)
-- Dependencies: 457
-- Name: FUNCTION postgis_liblwgeom_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_liblwgeom_version() TO coptool;


--
-- TOC entry 6256 (class 0 OID 0)
-- Dependencies: 1263
-- Name: FUNCTION postgis_libprotobuf_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_libprotobuf_version() TO coptool;


--
-- TOC entry 6257 (class 0 OID 0)
-- Dependencies: 458
-- Name: FUNCTION postgis_libxml_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_libxml_version() TO coptool;


--
-- TOC entry 6258 (class 0 OID 0)
-- Dependencies: 375
-- Name: FUNCTION postgis_noop(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_noop(public.geometry) TO coptool;


--
-- TOC entry 6259 (class 0 OID 0)
-- Dependencies: 459
-- Name: FUNCTION postgis_proj_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_proj_version() TO coptool;


--
-- TOC entry 6260 (class 0 OID 0)
-- Dependencies: 460
-- Name: FUNCTION postgis_scripts_build_date(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_scripts_build_date() TO coptool;


--
-- TOC entry 6261 (class 0 OID 0)
-- Dependencies: 461
-- Name: FUNCTION postgis_scripts_installed(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_scripts_installed() TO coptool;


--
-- TOC entry 6262 (class 0 OID 0)
-- Dependencies: 462
-- Name: FUNCTION postgis_scripts_released(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_scripts_released() TO coptool;


--
-- TOC entry 6263 (class 0 OID 0)
-- Dependencies: 463
-- Name: FUNCTION postgis_svn_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_svn_version() TO coptool;


--
-- TOC entry 6264 (class 0 OID 0)
-- Dependencies: 441
-- Name: FUNCTION postgis_transform_geometry(geom public.geometry, text, text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_transform_geometry(geom public.geometry, text, text, integer) TO coptool;


--
-- TOC entry 6265 (class 0 OID 0)
-- Dependencies: 755
-- Name: FUNCTION postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_type_name(geomname character varying, coord_dimension integer, use_new_name boolean) TO coptool;


--
-- TOC entry 6266 (class 0 OID 0)
-- Dependencies: 706
-- Name: FUNCTION postgis_typmod_dims(integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_typmod_dims(integer) TO coptool;


--
-- TOC entry 6267 (class 0 OID 0)
-- Dependencies: 707
-- Name: FUNCTION postgis_typmod_srid(integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_typmod_srid(integer) TO coptool;


--
-- TOC entry 6268 (class 0 OID 0)
-- Dependencies: 708
-- Name: FUNCTION postgis_typmod_type(integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_typmod_type(integer) TO coptool;


--
-- TOC entry 6269 (class 0 OID 0)
-- Dependencies: 464
-- Name: FUNCTION postgis_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_version() TO coptool;


--
-- TOC entry 6270 (class 0 OID 0)
-- Dependencies: 465
-- Name: FUNCTION postgis_wagyu_version(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.postgis_wagyu_version() TO coptool;


--
-- TOC entry 6271 (class 0 OID 0)
-- Dependencies: 906
-- Name: FUNCTION probe_geometry_columns(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.probe_geometry_columns() TO coptool;


--
-- TOC entry 6272 (class 0 OID 0)
-- Dependencies: 1044
-- Name: FUNCTION relate(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.relate(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6273 (class 0 OID 0)
-- Dependencies: 1045
-- Name: FUNCTION relate(public.geometry, public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.relate(public.geometry, public.geometry, text) TO coptool;


--
-- TOC entry 6274 (class 0 OID 0)
-- Dependencies: 1046
-- Name: FUNCTION removepoint(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.removepoint(public.geometry, integer) TO coptool;


--
-- TOC entry 6275 (class 0 OID 0)
-- Dependencies: 907
-- Name: FUNCTION rename_geometry_table_constraints(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.rename_geometry_table_constraints() TO coptool;


--
-- TOC entry 6276 (class 0 OID 0)
-- Dependencies: 1047
-- Name: FUNCTION reverse(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.reverse(public.geometry) TO coptool;


--
-- TOC entry 6277 (class 0 OID 0)
-- Dependencies: 908
-- Name: FUNCTION rotate(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.rotate(public.geometry, double precision) TO coptool;


--
-- TOC entry 6278 (class 0 OID 0)
-- Dependencies: 909
-- Name: FUNCTION rotatex(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.rotatex(public.geometry, double precision) TO coptool;


--
-- TOC entry 6279 (class 0 OID 0)
-- Dependencies: 910
-- Name: FUNCTION rotatey(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.rotatey(public.geometry, double precision) TO coptool;


--
-- TOC entry 6280 (class 0 OID 0)
-- Dependencies: 911
-- Name: FUNCTION rotatez(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.rotatez(public.geometry, double precision) TO coptool;


--
-- TOC entry 6281 (class 0 OID 0)
-- Dependencies: 912
-- Name: FUNCTION scale(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.scale(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6282 (class 0 OID 0)
-- Dependencies: 913
-- Name: FUNCTION scale(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.scale(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6283 (class 0 OID 0)
-- Dependencies: 895
-- Name: FUNCTION se_envelopesintersect(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_envelopesintersect(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6284 (class 0 OID 0)
-- Dependencies: 896
-- Name: FUNCTION se_is3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_is3d(public.geometry) TO coptool;


--
-- TOC entry 6285 (class 0 OID 0)
-- Dependencies: 897
-- Name: FUNCTION se_ismeasured(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_ismeasured(public.geometry) TO coptool;


--
-- TOC entry 6286 (class 0 OID 0)
-- Dependencies: 1264
-- Name: FUNCTION se_locatealong(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_locatealong(public.geometry, double precision) TO coptool;


--
-- TOC entry 6287 (class 0 OID 0)
-- Dependencies: 1265
-- Name: FUNCTION se_locatebetween(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_locatebetween(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6288 (class 0 OID 0)
-- Dependencies: 898
-- Name: FUNCTION se_m(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_m(public.geometry) TO coptool;


--
-- TOC entry 6289 (class 0 OID 0)
-- Dependencies: 899
-- Name: FUNCTION se_z(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.se_z(public.geometry) TO coptool;


--
-- TOC entry 6290 (class 0 OID 0)
-- Dependencies: 1266
-- Name: FUNCTION segmentize(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.segmentize(public.geometry, double precision) TO coptool;


--
-- TOC entry 6291 (class 0 OID 0)
-- Dependencies: 1048
-- Name: FUNCTION setpoint(public.geometry, integer, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.setpoint(public.geometry, integer, public.geometry) TO coptool;


--
-- TOC entry 6292 (class 0 OID 0)
-- Dependencies: 900
-- Name: FUNCTION setsrid(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.setsrid(public.geometry, integer) TO coptool;


--
-- TOC entry 6293 (class 0 OID 0)
-- Dependencies: 1049
-- Name: FUNCTION shift_longitude(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.shift_longitude(public.geometry) TO coptool;


--
-- TOC entry 6294 (class 0 OID 0)
-- Dependencies: 1050
-- Name: FUNCTION simplify(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.simplify(public.geometry, double precision) TO coptool;


--
-- TOC entry 6295 (class 0 OID 0)
-- Dependencies: 1051
-- Name: FUNCTION snaptogrid(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.snaptogrid(public.geometry, double precision) TO coptool;


--
-- TOC entry 6296 (class 0 OID 0)
-- Dependencies: 1267
-- Name: FUNCTION snaptogrid(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.snaptogrid(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6297 (class 0 OID 0)
-- Dependencies: 1052
-- Name: FUNCTION snaptogrid(public.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.snaptogrid(public.geometry, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6298 (class 0 OID 0)
-- Dependencies: 1053
-- Name: FUNCTION snaptogrid(public.geometry, public.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.snaptogrid(public.geometry, public.geometry, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6299 (class 0 OID 0)
-- Dependencies: 901
-- Name: FUNCTION srid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.srid(public.geometry) TO coptool;


--
-- TOC entry 6300 (class 0 OID 0)
-- Dependencies: 756
-- Name: FUNCTION st_3dclosestpoint(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dclosestpoint(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6301 (class 0 OID 0)
-- Dependencies: 556
-- Name: FUNCTION st_3ddfullywithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3ddfullywithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6302 (class 0 OID 0)
-- Dependencies: 757
-- Name: FUNCTION st_3ddistance(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3ddistance(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6303 (class 0 OID 0)
-- Dependencies: 557
-- Name: FUNCTION st_3ddwithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3ddwithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6304 (class 0 OID 0)
-- Dependencies: 1268
-- Name: FUNCTION st_3dintersects(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dintersects(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6305 (class 0 OID 0)
-- Dependencies: 1269
-- Name: FUNCTION st_3dlength(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dlength(public.geometry) TO coptool;


--
-- TOC entry 6306 (class 0 OID 0)
-- Dependencies: 1270
-- Name: FUNCTION st_3dlength_spheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dlength_spheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6307 (class 0 OID 0)
-- Dependencies: 810
-- Name: FUNCTION st_3dlineinterpolatepoint(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dlineinterpolatepoint(public.geometry, double precision) TO coptool;


--
-- TOC entry 6308 (class 0 OID 0)
-- Dependencies: 758
-- Name: FUNCTION st_3dlongestline(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dlongestline(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6309 (class 0 OID 0)
-- Dependencies: 1271
-- Name: FUNCTION st_3dmakebox(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dmakebox(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6310 (class 0 OID 0)
-- Dependencies: 759
-- Name: FUNCTION st_3dmaxdistance(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dmaxdistance(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6311 (class 0 OID 0)
-- Dependencies: 1272
-- Name: FUNCTION st_3dperimeter(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dperimeter(public.geometry) TO coptool;


--
-- TOC entry 6312 (class 0 OID 0)
-- Dependencies: 760
-- Name: FUNCTION st_3dshortestline(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_3dshortestline(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6313 (class 0 OID 0)
-- Dependencies: 472
-- Name: FUNCTION st_addmeasure(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_addmeasure(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6314 (class 0 OID 0)
-- Dependencies: 397
-- Name: FUNCTION st_addpoint(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_addpoint(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6315 (class 0 OID 0)
-- Dependencies: 398
-- Name: FUNCTION st_addpoint(geom1 public.geometry, geom2 public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_addpoint(geom1 public.geometry, geom2 public.geometry, integer) TO coptool;


--
-- TOC entry 6316 (class 0 OID 0)
-- Dependencies: 399
-- Name: FUNCTION st_affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6317 (class 0 OID 0)
-- Dependencies: 400
-- Name: FUNCTION st_affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_affine(public.geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6318 (class 0 OID 0)
-- Dependencies: 811
-- Name: FUNCTION st_angle(line1 public.geometry, line2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_angle(line1 public.geometry, line2 public.geometry) TO coptool;


--
-- TOC entry 6319 (class 0 OID 0)
-- Dependencies: 1273
-- Name: FUNCTION st_angle(pt1 public.geometry, pt2 public.geometry, pt3 public.geometry, pt4 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_angle(pt1 public.geometry, pt2 public.geometry, pt3 public.geometry, pt4 public.geometry) TO coptool;


--
-- TOC entry 6320 (class 0 OID 0)
-- Dependencies: 719
-- Name: FUNCTION st_area(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_area(text) TO coptool;


--
-- TOC entry 6321 (class 0 OID 0)
-- Dependencies: 353
-- Name: FUNCTION st_area(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_area(public.geometry) TO coptool;


--
-- TOC entry 6322 (class 0 OID 0)
-- Dependencies: 1274
-- Name: FUNCTION st_area(geog public.geography, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_area(geog public.geography, use_spheroid boolean) TO coptool;


--
-- TOC entry 6323 (class 0 OID 0)
-- Dependencies: 354
-- Name: FUNCTION st_area2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_area2d(public.geometry) TO coptool;


--
-- TOC entry 6324 (class 0 OID 0)
-- Dependencies: 1275
-- Name: FUNCTION st_asbinary(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asbinary(text) TO coptool;


--
-- TOC entry 6325 (class 0 OID 0)
-- Dependencies: 1276
-- Name: FUNCTION st_asbinary(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asbinary(public.geography) TO coptool;


--
-- TOC entry 6326 (class 0 OID 0)
-- Dependencies: 1277
-- Name: FUNCTION st_asbinary(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asbinary(public.geometry) TO coptool;


--
-- TOC entry 6327 (class 0 OID 0)
-- Dependencies: 733
-- Name: FUNCTION st_asbinary(public.geography, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asbinary(public.geography, text) TO coptool;


--
-- TOC entry 6328 (class 0 OID 0)
-- Dependencies: 608
-- Name: FUNCTION st_asbinary(public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asbinary(public.geometry, text) TO coptool;


--
-- TOC entry 6329 (class 0 OID 0)
-- Dependencies: 1278
-- Name: FUNCTION st_asencodedpolyline(geom public.geometry, nprecision integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asencodedpolyline(geom public.geometry, nprecision integer) TO coptool;


--
-- TOC entry 6330 (class 0 OID 0)
-- Dependencies: 376
-- Name: FUNCTION st_asewkb(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkb(public.geometry) TO coptool;


--
-- TOC entry 6331 (class 0 OID 0)
-- Dependencies: 1279
-- Name: FUNCTION st_asewkb(public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkb(public.geometry, text) TO coptool;


--
-- TOC entry 6332 (class 0 OID 0)
-- Dependencies: 734
-- Name: FUNCTION st_asewkt(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkt(text) TO coptool;


--
-- TOC entry 6333 (class 0 OID 0)
-- Dependencies: 735
-- Name: FUNCTION st_asewkt(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkt(public.geography) TO coptool;


--
-- TOC entry 6334 (class 0 OID 0)
-- Dependencies: 377
-- Name: FUNCTION st_asewkt(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkt(public.geometry) TO coptool;


--
-- TOC entry 6335 (class 0 OID 0)
-- Dependencies: 1280
-- Name: FUNCTION st_asewkt(public.geography, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkt(public.geography, integer) TO coptool;


--
-- TOC entry 6336 (class 0 OID 0)
-- Dependencies: 378
-- Name: FUNCTION st_asewkt(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asewkt(public.geometry, integer) TO coptool;


--
-- TOC entry 6337 (class 0 OID 0)
-- Dependencies: 720
-- Name: FUNCTION st_asgeojson(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgeojson(text) TO coptool;


--
-- TOC entry 6338 (class 0 OID 0)
-- Dependencies: 721
-- Name: FUNCTION st_asgeojson(geog public.geography, maxdecimaldigits integer, options integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgeojson(geog public.geography, maxdecimaldigits integer, options integer) TO coptool;


--
-- TOC entry 6339 (class 0 OID 0)
-- Dependencies: 1281
-- Name: FUNCTION st_asgeojson(geom public.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgeojson(geom public.geometry, maxdecimaldigits integer, options integer) TO coptool;


--
-- TOC entry 6340 (class 0 OID 0)
-- Dependencies: 1091
-- Name: FUNCTION st_asgeojson(version integer, geog public.geography, maxdecimaldigits integer, options integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgeojson(version integer, geog public.geography, maxdecimaldigits integer, options integer) TO coptool;


--
-- TOC entry 6341 (class 0 OID 0)
-- Dependencies: 1092
-- Name: FUNCTION st_asgeojson(version integer, geog public.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgeojson(version integer, geog public.geometry, maxdecimaldigits integer, options integer) TO coptool;


--
-- TOC entry 6342 (class 0 OID 0)
-- Dependencies: 603
-- Name: FUNCTION st_asgeojson(r record, geom_column text, maxdecimaldigits integer, pretty_bool boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgeojson(r record, geom_column text, maxdecimaldigits integer, pretty_bool boolean) TO coptool;


--
-- TOC entry 6343 (class 0 OID 0)
-- Dependencies: 722
-- Name: FUNCTION st_asgml(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgml(text) TO coptool;


--
-- TOC entry 6344 (class 0 OID 0)
-- Dependencies: 1282
-- Name: FUNCTION st_asgml(geom public.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgml(geom public.geometry, maxdecimaldigits integer, options integer) TO coptool;


--
-- TOC entry 6345 (class 0 OID 0)
-- Dependencies: 1283
-- Name: FUNCTION st_asgml(geog public.geography, maxdecimaldigits integer, options integer, nprefix text, id text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgml(geog public.geography, maxdecimaldigits integer, options integer, nprefix text, id text) TO coptool;


--
-- TOC entry 6346 (class 0 OID 0)
-- Dependencies: 723
-- Name: FUNCTION st_asgml(version integer, geog public.geography, maxdecimaldigits integer, options integer, nprefix text, id text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgml(version integer, geog public.geography, maxdecimaldigits integer, options integer, nprefix text, id text) TO coptool;


--
-- TOC entry 6347 (class 0 OID 0)
-- Dependencies: 574
-- Name: FUNCTION st_asgml(version integer, geom public.geometry, maxdecimaldigits integer, options integer, nprefix text, id text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asgml(version integer, geom public.geometry, maxdecimaldigits integer, options integer, nprefix text, id text) TO coptool;


--
-- TOC entry 6348 (class 0 OID 0)
-- Dependencies: 379
-- Name: FUNCTION st_ashexewkb(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ashexewkb(public.geometry) TO coptool;


--
-- TOC entry 6349 (class 0 OID 0)
-- Dependencies: 380
-- Name: FUNCTION st_ashexewkb(public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ashexewkb(public.geometry, text) TO coptool;


--
-- TOC entry 6350 (class 0 OID 0)
-- Dependencies: 724
-- Name: FUNCTION st_askml(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_askml(text) TO coptool;


--
-- TOC entry 6351 (class 0 OID 0)
-- Dependencies: 725
-- Name: FUNCTION st_askml(geog public.geography, maxdecimaldigits integer, nprefix text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_askml(geog public.geography, maxdecimaldigits integer, nprefix text) TO coptool;


--
-- TOC entry 6352 (class 0 OID 0)
-- Dependencies: 604
-- Name: FUNCTION st_askml(geom public.geometry, maxdecimaldigits integer, nprefix text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_askml(geom public.geometry, maxdecimaldigits integer, nprefix text) TO coptool;


--
-- TOC entry 6353 (class 0 OID 0)
-- Dependencies: 1284
-- Name: FUNCTION st_askml(version integer, geom public.geography, maxdecimaldigits integer, nprefix text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_askml(version integer, geom public.geography, maxdecimaldigits integer, nprefix text) TO coptool;


--
-- TOC entry 6354 (class 0 OID 0)
-- Dependencies: 1093
-- Name: FUNCTION st_askml(version integer, geom public.geometry, maxdecimaldigits integer, nprefix text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_askml(version integer, geom public.geometry, maxdecimaldigits integer, nprefix text) TO coptool;


--
-- TOC entry 6355 (class 0 OID 0)
-- Dependencies: 1285
-- Name: FUNCTION st_aslatlontext(geom public.geometry, tmpl text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_aslatlontext(geom public.geometry, tmpl text) TO coptool;


--
-- TOC entry 6356 (class 0 OID 0)
-- Dependencies: 605
-- Name: FUNCTION st_asmvtgeom(geom public.geometry, bounds public.box2d, extent integer, buffer integer, clip_geom boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asmvtgeom(geom public.geometry, bounds public.box2d, extent integer, buffer integer, clip_geom boolean) TO coptool;


--
-- TOC entry 6357 (class 0 OID 0)
-- Dependencies: 726
-- Name: FUNCTION st_assvg(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_assvg(text) TO coptool;


--
-- TOC entry 6358 (class 0 OID 0)
-- Dependencies: 727
-- Name: FUNCTION st_assvg(geog public.geography, rel integer, maxdecimaldigits integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_assvg(geog public.geography, rel integer, maxdecimaldigits integer) TO coptool;


--
-- TOC entry 6359 (class 0 OID 0)
-- Dependencies: 575
-- Name: FUNCTION st_assvg(geom public.geometry, rel integer, maxdecimaldigits integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_assvg(geom public.geometry, rel integer, maxdecimaldigits integer) TO coptool;


--
-- TOC entry 6360 (class 0 OID 0)
-- Dependencies: 902
-- Name: FUNCTION st_astext(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astext(bytea) TO coptool;


--
-- TOC entry 6361 (class 0 OID 0)
-- Dependencies: 709
-- Name: FUNCTION st_astext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astext(text) TO coptool;


--
-- TOC entry 6362 (class 0 OID 0)
-- Dependencies: 1286
-- Name: FUNCTION st_astext(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astext(public.geography) TO coptool;


--
-- TOC entry 6363 (class 0 OID 0)
-- Dependencies: 609
-- Name: FUNCTION st_astext(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astext(public.geometry) TO coptool;


--
-- TOC entry 6364 (class 0 OID 0)
-- Dependencies: 710
-- Name: FUNCTION st_astext(public.geography, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astext(public.geography, integer) TO coptool;


--
-- TOC entry 6365 (class 0 OID 0)
-- Dependencies: 610
-- Name: FUNCTION st_astext(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astext(public.geometry, integer) TO coptool;


--
-- TOC entry 6366 (class 0 OID 0)
-- Dependencies: 1287
-- Name: FUNCTION st_astwkb(geom public.geometry, prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astwkb(geom public.geometry, prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean) TO coptool;


--
-- TOC entry 6367 (class 0 OID 0)
-- Dependencies: 381
-- Name: FUNCTION st_astwkb(geom public.geometry[], ids bigint[], prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_astwkb(geom public.geometry[], ids bigint[], prec integer, prec_z integer, prec_m integer, with_sizes boolean, with_boxes boolean) TO coptool;


--
-- TOC entry 6368 (class 0 OID 0)
-- Dependencies: 1289
-- Name: FUNCTION st_asx3d(geom public.geometry, maxdecimaldigits integer, options integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_asx3d(geom public.geometry, maxdecimaldigits integer, options integer) TO coptool;


--
-- TOC entry 6369 (class 0 OID 0)
-- Dependencies: 736
-- Name: FUNCTION st_azimuth(geog1 public.geography, geog2 public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_azimuth(geog1 public.geography, geog2 public.geography) TO coptool;


--
-- TOC entry 6370 (class 0 OID 0)
-- Dependencies: 355
-- Name: FUNCTION st_azimuth(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_azimuth(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6371 (class 0 OID 0)
-- Dependencies: 1290
-- Name: FUNCTION st_bdmpolyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_bdmpolyfromtext(text, integer) TO coptool;


--
-- TOC entry 6372 (class 0 OID 0)
-- Dependencies: 656
-- Name: FUNCTION st_bdpolyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_bdpolyfromtext(text, integer) TO coptool;


--
-- TOC entry 6373 (class 0 OID 0)
-- Dependencies: 1291
-- Name: FUNCTION st_boundary(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_boundary(public.geometry) TO coptool;


--
-- TOC entry 6374 (class 0 OID 0)
-- Dependencies: 382
-- Name: FUNCTION st_boundingdiagonal(geom public.geometry, fits boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_boundingdiagonal(geom public.geometry, fits boolean) TO coptool;


--
-- TOC entry 6375 (class 0 OID 0)
-- Dependencies: 914
-- Name: FUNCTION st_box(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box(public.box3d) TO coptool;


--
-- TOC entry 6376 (class 0 OID 0)
-- Dependencies: 915
-- Name: FUNCTION st_box(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box(public.geometry) TO coptool;


--
-- TOC entry 6377 (class 0 OID 0)
-- Dependencies: 916
-- Name: FUNCTION st_box2d(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box2d(public.box3d) TO coptool;


--
-- TOC entry 6378 (class 0 OID 0)
-- Dependencies: 867
-- Name: FUNCTION st_box2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box2d(public.geometry) TO coptool;


--
-- TOC entry 6379 (class 0 OID 0)
-- Dependencies: 576
-- Name: FUNCTION st_box2dfromgeohash(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box2dfromgeohash(text, integer) TO coptool;


--
-- TOC entry 6380 (class 0 OID 0)
-- Dependencies: 917
-- Name: FUNCTION st_box3d(public.box2d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box3d(public.box2d) TO coptool;


--
-- TOC entry 6381 (class 0 OID 0)
-- Dependencies: 918
-- Name: FUNCTION st_box3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box3d(public.geometry) TO coptool;


--
-- TOC entry 6382 (class 0 OID 0)
-- Dependencies: 1292
-- Name: FUNCTION st_box3d_in(cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box3d_in(cstring) TO coptool;


--
-- TOC entry 6383 (class 0 OID 0)
-- Dependencies: 919
-- Name: FUNCTION st_box3d_out(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_box3d_out(public.box3d) TO coptool;


--
-- TOC entry 6384 (class 0 OID 0)
-- Dependencies: 737
-- Name: FUNCTION st_buffer(text, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(text, double precision) TO coptool;


--
-- TOC entry 6385 (class 0 OID 0)
-- Dependencies: 1293
-- Name: FUNCTION st_buffer(public.geography, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(public.geography, double precision) TO coptool;


--
-- TOC entry 6386 (class 0 OID 0)
-- Dependencies: 738
-- Name: FUNCTION st_buffer(text, double precision, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(text, double precision, integer) TO coptool;


--
-- TOC entry 6387 (class 0 OID 0)
-- Dependencies: 739
-- Name: FUNCTION st_buffer(text, double precision, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(text, double precision, text) TO coptool;


--
-- TOC entry 6388 (class 0 OID 0)
-- Dependencies: 740
-- Name: FUNCTION st_buffer(public.geography, double precision, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(public.geography, double precision, integer) TO coptool;


--
-- TOC entry 6389 (class 0 OID 0)
-- Dependencies: 741
-- Name: FUNCTION st_buffer(public.geography, double precision, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(public.geography, double precision, text) TO coptool;


--
-- TOC entry 6390 (class 0 OID 0)
-- Dependencies: 492
-- Name: FUNCTION st_buffer(geom public.geometry, radius double precision, quadsegs integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(geom public.geometry, radius double precision, quadsegs integer) TO coptool;


--
-- TOC entry 6391 (class 0 OID 0)
-- Dependencies: 1294
-- Name: FUNCTION st_buffer(geom public.geometry, radius double precision, options text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buffer(geom public.geometry, radius double precision, options text) TO coptool;


--
-- TOC entry 6392 (class 0 OID 0)
-- Dependencies: 401
-- Name: FUNCTION st_buildarea(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_buildarea(public.geometry) TO coptool;


--
-- TOC entry 6393 (class 0 OID 0)
-- Dependencies: 920
-- Name: FUNCTION st_bytea(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_bytea(public.geometry) TO coptool;


--
-- TOC entry 6394 (class 0 OID 0)
-- Dependencies: 742
-- Name: FUNCTION st_centroid(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_centroid(text) TO coptool;


--
-- TOC entry 6395 (class 0 OID 0)
-- Dependencies: 577
-- Name: FUNCTION st_centroid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_centroid(public.geometry) TO coptool;


--
-- TOC entry 6396 (class 0 OID 0)
-- Dependencies: 1295
-- Name: FUNCTION st_centroid(public.geography, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_centroid(public.geography, use_spheroid boolean) TO coptool;


--
-- TOC entry 6397 (class 0 OID 0)
-- Dependencies: 1296
-- Name: FUNCTION st_chaikinsmoothing(public.geometry, integer, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_chaikinsmoothing(public.geometry, integer, boolean) TO coptool;


--
-- TOC entry 6398 (class 0 OID 0)
-- Dependencies: 511
-- Name: FUNCTION st_cleangeometry(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_cleangeometry(public.geometry) TO coptool;


--
-- TOC entry 6399 (class 0 OID 0)
-- Dependencies: 512
-- Name: FUNCTION st_clipbybox2d(geom public.geometry, box public.box2d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_clipbybox2d(geom public.geometry, box public.box2d) TO coptool;


--
-- TOC entry 6400 (class 0 OID 0)
-- Dependencies: 657
-- Name: FUNCTION st_closestpoint(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_closestpoint(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6401 (class 0 OID 0)
-- Dependencies: 473
-- Name: FUNCTION st_closestpointofapproach(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_closestpointofapproach(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6402 (class 0 OID 0)
-- Dependencies: 1297
-- Name: FUNCTION st_clusterintersecting(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_clusterintersecting(public.geometry[]) TO coptool;


--
-- TOC entry 6403 (class 0 OID 0)
-- Dependencies: 402
-- Name: FUNCTION st_clusterwithin(public.geometry[], double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_clusterwithin(public.geometry[], double precision) TO coptool;


--
-- TOC entry 6404 (class 0 OID 0)
-- Dependencies: 540
-- Name: FUNCTION st_collect(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_collect(public.geometry[]) TO coptool;


--
-- TOC entry 6405 (class 0 OID 0)
-- Dependencies: 541
-- Name: FUNCTION st_collect(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_collect(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6406 (class 0 OID 0)
-- Dependencies: 356
-- Name: FUNCTION st_collectionextract(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_collectionextract(public.geometry) TO coptool;


--
-- TOC entry 6407 (class 0 OID 0)
-- Dependencies: 357
-- Name: FUNCTION st_collectionextract(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_collectionextract(public.geometry, integer) TO coptool;


--
-- TOC entry 6408 (class 0 OID 0)
-- Dependencies: 358
-- Name: FUNCTION st_collectionhomogenize(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_collectionhomogenize(public.geometry) TO coptool;


--
-- TOC entry 6409 (class 0 OID 0)
-- Dependencies: 1094
-- Name: FUNCTION st_combine_bbox(public.box2d, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_combine_bbox(public.box2d, public.geometry) TO coptool;


--
-- TOC entry 6410 (class 0 OID 0)
-- Dependencies: 1095
-- Name: FUNCTION st_combine_bbox(public.box3d, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_combine_bbox(public.box3d, public.geometry) TO coptool;


--
-- TOC entry 6411 (class 0 OID 0)
-- Dependencies: 542
-- Name: FUNCTION st_combinebbox(public.box2d, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_combinebbox(public.box2d, public.geometry) TO coptool;


--
-- TOC entry 6412 (class 0 OID 0)
-- Dependencies: 513
-- Name: FUNCTION st_combinebbox(public.box3d, public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_combinebbox(public.box3d, public.box3d) TO coptool;


--
-- TOC entry 6413 (class 0 OID 0)
-- Dependencies: 514
-- Name: FUNCTION st_combinebbox(public.box3d, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_combinebbox(public.box3d, public.geometry) TO coptool;


--
-- TOC entry 6414 (class 0 OID 0)
-- Dependencies: 812
-- Name: FUNCTION st_concavehull(param_geom public.geometry, param_pctconvex double precision, param_allow_holes boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_concavehull(param_geom public.geometry, param_pctconvex double precision, param_allow_holes boolean) TO coptool;


--
-- TOC entry 6415 (class 0 OID 0)
-- Dependencies: 558
-- Name: FUNCTION st_contains(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_contains(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6416 (class 0 OID 0)
-- Dependencies: 559
-- Name: FUNCTION st_containsproperly(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_containsproperly(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6417 (class 0 OID 0)
-- Dependencies: 493
-- Name: FUNCTION st_convexhull(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_convexhull(public.geometry) TO coptool;


--
-- TOC entry 6418 (class 0 OID 0)
-- Dependencies: 777
-- Name: FUNCTION st_coorddim(geometry public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_coorddim(geometry public.geometry) TO coptool;


--
-- TOC entry 6419 (class 0 OID 0)
-- Dependencies: 761
-- Name: FUNCTION st_coveredby(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_coveredby(text, text) TO coptool;


--
-- TOC entry 6420 (class 0 OID 0)
-- Dependencies: 762
-- Name: FUNCTION st_coveredby(geog1 public.geography, geog2 public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_coveredby(geog1 public.geography, geog2 public.geography) TO coptool;


--
-- TOC entry 6421 (class 0 OID 0)
-- Dependencies: 560
-- Name: FUNCTION st_coveredby(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_coveredby(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6422 (class 0 OID 0)
-- Dependencies: 763
-- Name: FUNCTION st_covers(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_covers(text, text) TO coptool;


--
-- TOC entry 6423 (class 0 OID 0)
-- Dependencies: 764
-- Name: FUNCTION st_covers(geog1 public.geography, geog2 public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_covers(geog1 public.geography, geog2 public.geography) TO coptool;


--
-- TOC entry 6424 (class 0 OID 0)
-- Dependencies: 561
-- Name: FUNCTION st_covers(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_covers(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6425 (class 0 OID 0)
-- Dependencies: 474
-- Name: FUNCTION st_cpawithin(public.geometry, public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_cpawithin(public.geometry, public.geometry, double precision) TO coptool;


--
-- TOC entry 6426 (class 0 OID 0)
-- Dependencies: 1298
-- Name: FUNCTION st_crosses(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_crosses(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6427 (class 0 OID 0)
-- Dependencies: 1299
-- Name: FUNCTION st_curvetoline(geom public.geometry, tol double precision, toltype integer, flags integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_curvetoline(geom public.geometry, tol double precision, toltype integer, flags integer) TO coptool;


--
-- TOC entry 6428 (class 0 OID 0)
-- Dependencies: 1300
-- Name: FUNCTION st_delaunaytriangles(g1 public.geometry, tolerance double precision, flags integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_delaunaytriangles(g1 public.geometry, tolerance double precision, flags integer) TO coptool;


--
-- TOC entry 6429 (class 0 OID 0)
-- Dependencies: 562
-- Name: FUNCTION st_dfullywithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dfullywithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6430 (class 0 OID 0)
-- Dependencies: 494
-- Name: FUNCTION st_difference(geom1 public.geometry, geom2 public.geometry, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_difference(geom1 public.geometry, geom2 public.geometry, gridsize double precision) TO coptool;


--
-- TOC entry 6431 (class 0 OID 0)
-- Dependencies: 1301
-- Name: FUNCTION st_dimension(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dimension(public.geometry) TO coptool;


--
-- TOC entry 6432 (class 0 OID 0)
-- Dependencies: 1302
-- Name: FUNCTION st_disjoint(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_disjoint(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6433 (class 0 OID 0)
-- Dependencies: 728
-- Name: FUNCTION st_distance(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distance(text, text) TO coptool;


--
-- TOC entry 6434 (class 0 OID 0)
-- Dependencies: 359
-- Name: FUNCTION st_distance(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distance(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6435 (class 0 OID 0)
-- Dependencies: 729
-- Name: FUNCTION st_distance(geog1 public.geography, geog2 public.geography, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distance(geog1 public.geography, geog2 public.geography, use_spheroid boolean) TO coptool;


--
-- TOC entry 6436 (class 0 OID 0)
-- Dependencies: 1096
-- Name: FUNCTION st_distance_sphere(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distance_sphere(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6437 (class 0 OID 0)
-- Dependencies: 1303
-- Name: FUNCTION st_distance_spheroid(geom1 public.geometry, geom2 public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distance_spheroid(geom1 public.geometry, geom2 public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6438 (class 0 OID 0)
-- Dependencies: 475
-- Name: FUNCTION st_distancecpa(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distancecpa(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6439 (class 0 OID 0)
-- Dependencies: 765
-- Name: FUNCTION st_distancesphere(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distancesphere(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6440 (class 0 OID 0)
-- Dependencies: 360
-- Name: FUNCTION st_distancespheroid(geom1 public.geometry, geom2 public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_distancespheroid(geom1 public.geometry, geom2 public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6441 (class 0 OID 0)
-- Dependencies: 420
-- Name: FUNCTION st_dump(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dump(public.geometry) TO coptool;


--
-- TOC entry 6442 (class 0 OID 0)
-- Dependencies: 421
-- Name: FUNCTION st_dumppoints(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dumppoints(public.geometry) TO coptool;


--
-- TOC entry 6443 (class 0 OID 0)
-- Dependencies: 422
-- Name: FUNCTION st_dumprings(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dumprings(public.geometry) TO coptool;


--
-- TOC entry 6444 (class 0 OID 0)
-- Dependencies: 766
-- Name: FUNCTION st_dwithin(text, text, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dwithin(text, text, double precision) TO coptool;


--
-- TOC entry 6445 (class 0 OID 0)
-- Dependencies: 563
-- Name: FUNCTION st_dwithin(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dwithin(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6446 (class 0 OID 0)
-- Dependencies: 767
-- Name: FUNCTION st_dwithin(geog1 public.geography, geog2 public.geography, tolerance double precision, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_dwithin(geog1 public.geography, geog2 public.geography, tolerance double precision, use_spheroid boolean) TO coptool;


--
-- TOC entry 6447 (class 0 OID 0)
-- Dependencies: 611
-- Name: FUNCTION st_endpoint(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_endpoint(public.geometry) TO coptool;


--
-- TOC entry 6448 (class 0 OID 0)
-- Dependencies: 383
-- Name: FUNCTION st_envelope(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_envelope(public.geometry) TO coptool;


--
-- TOC entry 6449 (class 0 OID 0)
-- Dependencies: 564
-- Name: FUNCTION st_equals(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_equals(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6450 (class 0 OID 0)
-- Dependencies: 1057
-- Name: FUNCTION st_estimated_extent(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_estimated_extent(text, text) TO coptool;


--
-- TOC entry 6451 (class 0 OID 0)
-- Dependencies: 1058
-- Name: FUNCTION st_estimated_extent(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_estimated_extent(text, text, text) TO coptool;


--
-- TOC entry 6452 (class 0 OID 0)
-- Dependencies: 332
-- Name: FUNCTION st_estimatedextent(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_estimatedextent(text, text) TO coptool;


--
-- TOC entry 6453 (class 0 OID 0)
-- Dependencies: 333
-- Name: FUNCTION st_estimatedextent(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_estimatedextent(text, text, text) TO coptool;


--
-- TOC entry 6454 (class 0 OID 0)
-- Dependencies: 334
-- Name: FUNCTION st_estimatedextent(text, text, text, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_estimatedextent(text, text, text, boolean) TO coptool;


--
-- TOC entry 6455 (class 0 OID 0)
-- Dependencies: 335
-- Name: FUNCTION st_expand(public.box2d, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_expand(public.box2d, double precision) TO coptool;


--
-- TOC entry 6456 (class 0 OID 0)
-- Dependencies: 361
-- Name: FUNCTION st_expand(public.box3d, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_expand(public.box3d, double precision) TO coptool;


--
-- TOC entry 6457 (class 0 OID 0)
-- Dependencies: 384
-- Name: FUNCTION st_expand(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_expand(public.geometry, double precision) TO coptool;


--
-- TOC entry 6458 (class 0 OID 0)
-- Dependencies: 1304
-- Name: FUNCTION st_expand(box public.box2d, dx double precision, dy double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_expand(box public.box2d, dx double precision, dy double precision) TO coptool;


--
-- TOC entry 6459 (class 0 OID 0)
-- Dependencies: 385
-- Name: FUNCTION st_expand(box public.box3d, dx double precision, dy double precision, dz double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_expand(box public.box3d, dx double precision, dy double precision, dz double precision) TO coptool;


--
-- TOC entry 6460 (class 0 OID 0)
-- Dependencies: 386
-- Name: FUNCTION st_expand(geom public.geometry, dx double precision, dy double precision, dz double precision, dm double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_expand(geom public.geometry, dx double precision, dy double precision, dz double precision, dm double precision) TO coptool;


--
-- TOC entry 6461 (class 0 OID 0)
-- Dependencies: 612
-- Name: FUNCTION st_exteriorring(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_exteriorring(public.geometry) TO coptool;


--
-- TOC entry 6462 (class 0 OID 0)
-- Dependencies: 476
-- Name: FUNCTION st_filterbym(public.geometry, double precision, double precision, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_filterbym(public.geometry, double precision, double precision, boolean) TO coptool;


--
-- TOC entry 6463 (class 0 OID 0)
-- Dependencies: 1059
-- Name: FUNCTION st_find_extent(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_find_extent(text, text) TO coptool;


--
-- TOC entry 6464 (class 0 OID 0)
-- Dependencies: 1060
-- Name: FUNCTION st_find_extent(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_find_extent(text, text, text) TO coptool;


--
-- TOC entry 6465 (class 0 OID 0)
-- Dependencies: 1305
-- Name: FUNCTION st_findextent(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_findextent(text, text) TO coptool;


--
-- TOC entry 6466 (class 0 OID 0)
-- Dependencies: 336
-- Name: FUNCTION st_findextent(text, text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_findextent(text, text, text) TO coptool;


--
-- TOC entry 6467 (class 0 OID 0)
-- Dependencies: 658
-- Name: FUNCTION st_flipcoordinates(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_flipcoordinates(public.geometry) TO coptool;


--
-- TOC entry 6468 (class 0 OID 0)
-- Dependencies: 1306
-- Name: FUNCTION st_force2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force2d(public.geometry) TO coptool;


--
-- TOC entry 6469 (class 0 OID 0)
-- Dependencies: 1307
-- Name: FUNCTION st_force3d(geom public.geometry, zvalue double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force3d(geom public.geometry, zvalue double precision) TO coptool;


--
-- TOC entry 6470 (class 0 OID 0)
-- Dependencies: 362
-- Name: FUNCTION st_force3dm(geom public.geometry, mvalue double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force3dm(geom public.geometry, mvalue double precision) TO coptool;


--
-- TOC entry 6471 (class 0 OID 0)
-- Dependencies: 363
-- Name: FUNCTION st_force3dz(geom public.geometry, zvalue double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force3dz(geom public.geometry, zvalue double precision) TO coptool;


--
-- TOC entry 6472 (class 0 OID 0)
-- Dependencies: 1308
-- Name: FUNCTION st_force4d(geom public.geometry, zvalue double precision, mvalue double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force4d(geom public.geometry, zvalue double precision, mvalue double precision) TO coptool;


--
-- TOC entry 6473 (class 0 OID 0)
-- Dependencies: 1061
-- Name: FUNCTION st_force_2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force_2d(public.geometry) TO coptool;


--
-- TOC entry 6474 (class 0 OID 0)
-- Dependencies: 1309
-- Name: FUNCTION st_force_3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force_3d(public.geometry) TO coptool;


--
-- TOC entry 6475 (class 0 OID 0)
-- Dependencies: 1062
-- Name: FUNCTION st_force_3dm(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force_3dm(public.geometry) TO coptool;


--
-- TOC entry 6476 (class 0 OID 0)
-- Dependencies: 1063
-- Name: FUNCTION st_force_3dz(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force_3dz(public.geometry) TO coptool;


--
-- TOC entry 6477 (class 0 OID 0)
-- Dependencies: 1064
-- Name: FUNCTION st_force_4d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force_4d(public.geometry) TO coptool;


--
-- TOC entry 6478 (class 0 OID 0)
-- Dependencies: 1310
-- Name: FUNCTION st_force_collection(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_force_collection(public.geometry) TO coptool;


--
-- TOC entry 6479 (class 0 OID 0)
-- Dependencies: 364
-- Name: FUNCTION st_forcecollection(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcecollection(public.geometry) TO coptool;


--
-- TOC entry 6480 (class 0 OID 0)
-- Dependencies: 365
-- Name: FUNCTION st_forcecurve(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcecurve(public.geometry) TO coptool;


--
-- TOC entry 6481 (class 0 OID 0)
-- Dependencies: 387
-- Name: FUNCTION st_forcepolygonccw(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcepolygonccw(public.geometry) TO coptool;


--
-- TOC entry 6482 (class 0 OID 0)
-- Dependencies: 388
-- Name: FUNCTION st_forcepolygoncw(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcepolygoncw(public.geometry) TO coptool;


--
-- TOC entry 6483 (class 0 OID 0)
-- Dependencies: 389
-- Name: FUNCTION st_forcerhr(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcerhr(public.geometry) TO coptool;


--
-- TOC entry 6484 (class 0 OID 0)
-- Dependencies: 366
-- Name: FUNCTION st_forcesfs(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcesfs(public.geometry) TO coptool;


--
-- TOC entry 6485 (class 0 OID 0)
-- Dependencies: 367
-- Name: FUNCTION st_forcesfs(public.geometry, version text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_forcesfs(public.geometry, version text) TO coptool;


--
-- TOC entry 6486 (class 0 OID 0)
-- Dependencies: 1311
-- Name: FUNCTION st_frechetdistance(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_frechetdistance(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6487 (class 0 OID 0)
-- Dependencies: 495
-- Name: FUNCTION st_generatepoints(area public.geometry, npoints integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_generatepoints(area public.geometry, npoints integer) TO coptool;


--
-- TOC entry 6488 (class 0 OID 0)
-- Dependencies: 496
-- Name: FUNCTION st_generatepoints(area public.geometry, npoints integer, seed integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_generatepoints(area public.geometry, npoints integer, seed integer) TO coptool;


--
-- TOC entry 6489 (class 0 OID 0)
-- Dependencies: 711
-- Name: FUNCTION st_geogfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geogfromtext(text) TO coptool;


--
-- TOC entry 6490 (class 0 OID 0)
-- Dependencies: 712
-- Name: FUNCTION st_geogfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geogfromwkb(bytea) TO coptool;


--
-- TOC entry 6491 (class 0 OID 0)
-- Dependencies: 1312
-- Name: FUNCTION st_geographyfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geographyfromtext(text) TO coptool;


--
-- TOC entry 6492 (class 0 OID 0)
-- Dependencies: 743
-- Name: FUNCTION st_geohash(geog public.geography, maxchars integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geohash(geog public.geography, maxchars integer) TO coptool;


--
-- TOC entry 6493 (class 0 OID 0)
-- Dependencies: 606
-- Name: FUNCTION st_geohash(geom public.geometry, maxchars integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geohash(geom public.geometry, maxchars integer) TO coptool;


--
-- TOC entry 6494 (class 0 OID 0)
-- Dependencies: 1313
-- Name: FUNCTION st_geomcollfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomcollfromtext(text) TO coptool;


--
-- TOC entry 6495 (class 0 OID 0)
-- Dependencies: 633
-- Name: FUNCTION st_geomcollfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomcollfromtext(text, integer) TO coptool;


--
-- TOC entry 6496 (class 0 OID 0)
-- Dependencies: 659
-- Name: FUNCTION st_geomcollfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomcollfromwkb(bytea) TO coptool;


--
-- TOC entry 6497 (class 0 OID 0)
-- Dependencies: 660
-- Name: FUNCTION st_geomcollfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomcollfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6498 (class 0 OID 0)
-- Dependencies: 578
-- Name: FUNCTION st_geometricmedian(g public.geometry, tolerance double precision, max_iter integer, fail_if_not_converged boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometricmedian(g public.geometry, tolerance double precision, max_iter integer, fail_if_not_converged boolean) TO coptool;


--
-- TOC entry 6499 (class 0 OID 0)
-- Dependencies: 921
-- Name: FUNCTION st_geometry(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry(bytea) TO coptool;


--
-- TOC entry 6500 (class 0 OID 0)
-- Dependencies: 1314
-- Name: FUNCTION st_geometry(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry(text) TO coptool;


--
-- TOC entry 6501 (class 0 OID 0)
-- Dependencies: 922
-- Name: FUNCTION st_geometry(public.box2d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry(public.box2d) TO coptool;


--
-- TOC entry 6502 (class 0 OID 0)
-- Dependencies: 923
-- Name: FUNCTION st_geometry(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry(public.box3d) TO coptool;


--
-- TOC entry 6503 (class 0 OID 0)
-- Dependencies: 924
-- Name: FUNCTION st_geometry_cmp(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry_cmp(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6504 (class 0 OID 0)
-- Dependencies: 1315
-- Name: FUNCTION st_geometry_eq(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry_eq(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6505 (class 0 OID 0)
-- Dependencies: 925
-- Name: FUNCTION st_geometry_ge(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry_ge(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6506 (class 0 OID 0)
-- Dependencies: 926
-- Name: FUNCTION st_geometry_gt(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry_gt(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6507 (class 0 OID 0)
-- Dependencies: 927
-- Name: FUNCTION st_geometry_le(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry_le(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6508 (class 0 OID 0)
-- Dependencies: 928
-- Name: FUNCTION st_geometry_lt(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometry_lt(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6509 (class 0 OID 0)
-- Dependencies: 613
-- Name: FUNCTION st_geometryfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometryfromtext(text) TO coptool;


--
-- TOC entry 6510 (class 0 OID 0)
-- Dependencies: 1316
-- Name: FUNCTION st_geometryfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometryfromtext(text, integer) TO coptool;


--
-- TOC entry 6511 (class 0 OID 0)
-- Dependencies: 614
-- Name: FUNCTION st_geometryn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometryn(public.geometry, integer) TO coptool;


--
-- TOC entry 6512 (class 0 OID 0)
-- Dependencies: 615
-- Name: FUNCTION st_geometrytype(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geometrytype(public.geometry) TO coptool;


--
-- TOC entry 6513 (class 0 OID 0)
-- Dependencies: 403
-- Name: FUNCTION st_geomfromewkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromewkb(bytea) TO coptool;


--
-- TOC entry 6514 (class 0 OID 0)
-- Dependencies: 404
-- Name: FUNCTION st_geomfromewkt(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromewkt(text) TO coptool;


--
-- TOC entry 6515 (class 0 OID 0)
-- Dependencies: 1317
-- Name: FUNCTION st_geomfromgeohash(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromgeohash(text, integer) TO coptool;


--
-- TOC entry 6516 (class 0 OID 0)
-- Dependencies: 579
-- Name: FUNCTION st_geomfromgeojson(json); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromgeojson(json) TO coptool;


--
-- TOC entry 6517 (class 0 OID 0)
-- Dependencies: 580
-- Name: FUNCTION st_geomfromgeojson(jsonb); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromgeojson(jsonb) TO coptool;


--
-- TOC entry 6518 (class 0 OID 0)
-- Dependencies: 581
-- Name: FUNCTION st_geomfromgeojson(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromgeojson(text) TO coptool;


--
-- TOC entry 6519 (class 0 OID 0)
-- Dependencies: 582
-- Name: FUNCTION st_geomfromgml(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromgml(text) TO coptool;


--
-- TOC entry 6520 (class 0 OID 0)
-- Dependencies: 583
-- Name: FUNCTION st_geomfromgml(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromgml(text, integer) TO coptool;


--
-- TOC entry 6521 (class 0 OID 0)
-- Dependencies: 584
-- Name: FUNCTION st_geomfromkml(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromkml(text) TO coptool;


--
-- TOC entry 6522 (class 0 OID 0)
-- Dependencies: 616
-- Name: FUNCTION st_geomfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromtext(text) TO coptool;


--
-- TOC entry 6523 (class 0 OID 0)
-- Dependencies: 617
-- Name: FUNCTION st_geomfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromtext(text, integer) TO coptool;


--
-- TOC entry 6524 (class 0 OID 0)
-- Dependencies: 1318
-- Name: FUNCTION st_geomfromtwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromtwkb(bytea) TO coptool;


--
-- TOC entry 6525 (class 0 OID 0)
-- Dependencies: 634
-- Name: FUNCTION st_geomfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromwkb(bytea) TO coptool;


--
-- TOC entry 6526 (class 0 OID 0)
-- Dependencies: 635
-- Name: FUNCTION st_geomfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_geomfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6527 (class 0 OID 0)
-- Dependencies: 585
-- Name: FUNCTION st_gmltosql(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_gmltosql(text) TO coptool;


--
-- TOC entry 6528 (class 0 OID 0)
-- Dependencies: 586
-- Name: FUNCTION st_gmltosql(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_gmltosql(text, integer) TO coptool;


--
-- TOC entry 6529 (class 0 OID 0)
-- Dependencies: 778
-- Name: FUNCTION st_hasarc(geometry public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_hasarc(geometry public.geometry) TO coptool;


--
-- TOC entry 6530 (class 0 OID 0)
-- Dependencies: 497
-- Name: FUNCTION st_hausdorffdistance(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_hausdorffdistance(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6531 (class 0 OID 0)
-- Dependencies: 498
-- Name: FUNCTION st_hausdorffdistance(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_hausdorffdistance(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6532 (class 0 OID 0)
-- Dependencies: 779
-- Name: FUNCTION st_hexagon(size double precision, cell_i integer, cell_j integer, origin public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_hexagon(size double precision, cell_i integer, cell_j integer, origin public.geometry) TO coptool;


--
-- TOC entry 6533 (class 0 OID 0)
-- Dependencies: 780
-- Name: FUNCTION st_hexagongrid(size double precision, bounds public.geometry, OUT geom public.geometry, OUT i integer, OUT j integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_hexagongrid(size double precision, bounds public.geometry, OUT geom public.geometry, OUT i integer, OUT j integer) TO coptool;


--
-- TOC entry 6534 (class 0 OID 0)
-- Dependencies: 618
-- Name: FUNCTION st_interiorringn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_interiorringn(public.geometry, integer) TO coptool;


--
-- TOC entry 6535 (class 0 OID 0)
-- Dependencies: 781
-- Name: FUNCTION st_interpolatepoint(line public.geometry, point public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_interpolatepoint(line public.geometry, point public.geometry) TO coptool;


--
-- TOC entry 6536 (class 0 OID 0)
-- Dependencies: 744
-- Name: FUNCTION st_intersection(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_intersection(text, text) TO coptool;


--
-- TOC entry 6537 (class 0 OID 0)
-- Dependencies: 745
-- Name: FUNCTION st_intersection(public.geography, public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_intersection(public.geography, public.geography) TO coptool;


--
-- TOC entry 6538 (class 0 OID 0)
-- Dependencies: 499
-- Name: FUNCTION st_intersection(geom1 public.geometry, geom2 public.geometry, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_intersection(geom1 public.geometry, geom2 public.geometry, gridsize double precision) TO coptool;


--
-- TOC entry 6539 (class 0 OID 0)
-- Dependencies: 768
-- Name: FUNCTION st_intersects(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_intersects(text, text) TO coptool;


--
-- TOC entry 6540 (class 0 OID 0)
-- Dependencies: 769
-- Name: FUNCTION st_intersects(geog1 public.geography, geog2 public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_intersects(geog1 public.geography, geog2 public.geography) TO coptool;


--
-- TOC entry 6541 (class 0 OID 0)
-- Dependencies: 565
-- Name: FUNCTION st_intersects(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_intersects(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6542 (class 0 OID 0)
-- Dependencies: 619
-- Name: FUNCTION st_isclosed(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isclosed(public.geometry) TO coptool;


--
-- TOC entry 6543 (class 0 OID 0)
-- Dependencies: 587
-- Name: FUNCTION st_iscollection(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_iscollection(public.geometry) TO coptool;


--
-- TOC entry 6544 (class 0 OID 0)
-- Dependencies: 620
-- Name: FUNCTION st_isempty(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isempty(public.geometry) TO coptool;


--
-- TOC entry 6545 (class 0 OID 0)
-- Dependencies: 368
-- Name: FUNCTION st_ispolygonccw(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ispolygonccw(public.geometry) TO coptool;


--
-- TOC entry 6546 (class 0 OID 0)
-- Dependencies: 369
-- Name: FUNCTION st_ispolygoncw(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ispolygoncw(public.geometry) TO coptool;


--
-- TOC entry 6547 (class 0 OID 0)
-- Dependencies: 588
-- Name: FUNCTION st_isring(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isring(public.geometry) TO coptool;


--
-- TOC entry 6548 (class 0 OID 0)
-- Dependencies: 589
-- Name: FUNCTION st_issimple(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_issimple(public.geometry) TO coptool;


--
-- TOC entry 6549 (class 0 OID 0)
-- Dependencies: 566
-- Name: FUNCTION st_isvalid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isvalid(public.geometry) TO coptool;


--
-- TOC entry 6550 (class 0 OID 0)
-- Dependencies: 500
-- Name: FUNCTION st_isvalid(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isvalid(public.geometry, integer) TO coptool;


--
-- TOC entry 6551 (class 0 OID 0)
-- Dependencies: 501
-- Name: FUNCTION st_isvaliddetail(geom public.geometry, flags integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isvaliddetail(geom public.geometry, flags integer) TO coptool;


--
-- TOC entry 6552 (class 0 OID 0)
-- Dependencies: 502
-- Name: FUNCTION st_isvalidreason(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isvalidreason(public.geometry) TO coptool;


--
-- TOC entry 6553 (class 0 OID 0)
-- Dependencies: 503
-- Name: FUNCTION st_isvalidreason(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isvalidreason(public.geometry, integer) TO coptool;


--
-- TOC entry 6554 (class 0 OID 0)
-- Dependencies: 477
-- Name: FUNCTION st_isvalidtrajectory(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_isvalidtrajectory(public.geometry) TO coptool;


--
-- TOC entry 6555 (class 0 OID 0)
-- Dependencies: 746
-- Name: FUNCTION st_length(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length(text) TO coptool;


--
-- TOC entry 6556 (class 0 OID 0)
-- Dependencies: 337
-- Name: FUNCTION st_length(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length(public.geometry) TO coptool;


--
-- TOC entry 6557 (class 0 OID 0)
-- Dependencies: 747
-- Name: FUNCTION st_length(geog public.geography, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length(geog public.geography, use_spheroid boolean) TO coptool;


--
-- TOC entry 6558 (class 0 OID 0)
-- Dependencies: 338
-- Name: FUNCTION st_length2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length2d(public.geometry) TO coptool;


--
-- TOC entry 6559 (class 0 OID 0)
-- Dependencies: 1065
-- Name: FUNCTION st_length2d_spheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length2d_spheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6560 (class 0 OID 0)
-- Dependencies: 370
-- Name: FUNCTION st_length2dspheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length2dspheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6561 (class 0 OID 0)
-- Dependencies: 1097
-- Name: FUNCTION st_length3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length3d(public.geometry) TO coptool;


--
-- TOC entry 6562 (class 0 OID 0)
-- Dependencies: 1066
-- Name: FUNCTION st_length_spheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length_spheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6563 (class 0 OID 0)
-- Dependencies: 1098
-- Name: FUNCTION st_length_spheroid3d(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_length_spheroid3d(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6564 (class 0 OID 0)
-- Dependencies: 339
-- Name: FUNCTION st_lengthspheroid(public.geometry, public.spheroid); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_lengthspheroid(public.geometry, public.spheroid) TO coptool;


--
-- TOC entry 6565 (class 0 OID 0)
-- Dependencies: 1067
-- Name: FUNCTION st_line_interpolate_point(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_line_interpolate_point(public.geometry, double precision) TO coptool;


--
-- TOC entry 6566 (class 0 OID 0)
-- Dependencies: 1319
-- Name: FUNCTION st_line_locate_point(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_line_locate_point(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6567 (class 0 OID 0)
-- Dependencies: 1068
-- Name: FUNCTION st_line_substring(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_line_substring(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6568 (class 0 OID 0)
-- Dependencies: 1320
-- Name: FUNCTION st_linecrossingdirection(line1 public.geometry, line2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linecrossingdirection(line1 public.geometry, line2 public.geometry) TO coptool;


--
-- TOC entry 6569 (class 0 OID 0)
-- Dependencies: 1321
-- Name: FUNCTION st_linefromencodedpolyline(txtin text, nprecision integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linefromencodedpolyline(txtin text, nprecision integer) TO coptool;


--
-- TOC entry 6570 (class 0 OID 0)
-- Dependencies: 405
-- Name: FUNCTION st_linefrommultipoint(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linefrommultipoint(public.geometry) TO coptool;


--
-- TOC entry 6571 (class 0 OID 0)
-- Dependencies: 621
-- Name: FUNCTION st_linefromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linefromtext(text) TO coptool;


--
-- TOC entry 6572 (class 0 OID 0)
-- Dependencies: 1322
-- Name: FUNCTION st_linefromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linefromtext(text, integer) TO coptool;


--
-- TOC entry 6573 (class 0 OID 0)
-- Dependencies: 1323
-- Name: FUNCTION st_linefromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linefromwkb(bytea) TO coptool;


--
-- TOC entry 6574 (class 0 OID 0)
-- Dependencies: 636
-- Name: FUNCTION st_linefromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linefromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6575 (class 0 OID 0)
-- Dependencies: 478
-- Name: FUNCTION st_lineinterpolatepoint(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_lineinterpolatepoint(public.geometry, double precision) TO coptool;


--
-- TOC entry 6576 (class 0 OID 0)
-- Dependencies: 479
-- Name: FUNCTION st_lineinterpolatepoints(public.geometry, double precision, repeat boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_lineinterpolatepoints(public.geometry, double precision, repeat boolean) TO coptool;


--
-- TOC entry 6577 (class 0 OID 0)
-- Dependencies: 480
-- Name: FUNCTION st_linelocatepoint(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linelocatepoint(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6578 (class 0 OID 0)
-- Dependencies: 406
-- Name: FUNCTION st_linemerge(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linemerge(public.geometry) TO coptool;


--
-- TOC entry 6579 (class 0 OID 0)
-- Dependencies: 637
-- Name: FUNCTION st_linestringfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linestringfromwkb(bytea) TO coptool;


--
-- TOC entry 6580 (class 0 OID 0)
-- Dependencies: 638
-- Name: FUNCTION st_linestringfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linestringfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6581 (class 0 OID 0)
-- Dependencies: 481
-- Name: FUNCTION st_linesubstring(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linesubstring(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6582 (class 0 OID 0)
-- Dependencies: 782
-- Name: FUNCTION st_linetocurve(geometry public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_linetocurve(geometry public.geometry) TO coptool;


--
-- TOC entry 6583 (class 0 OID 0)
-- Dependencies: 1069
-- Name: FUNCTION st_locate_along_measure(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_locate_along_measure(public.geometry, double precision) TO coptool;


--
-- TOC entry 6584 (class 0 OID 0)
-- Dependencies: 1070
-- Name: FUNCTION st_locate_between_measures(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_locate_between_measures(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6585 (class 0 OID 0)
-- Dependencies: 783
-- Name: FUNCTION st_locatealong(geometry public.geometry, measure double precision, leftrightoffset double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_locatealong(geometry public.geometry, measure double precision, leftrightoffset double precision) TO coptool;


--
-- TOC entry 6586 (class 0 OID 0)
-- Dependencies: 784
-- Name: FUNCTION st_locatebetween(geometry public.geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_locatebetween(geometry public.geometry, frommeasure double precision, tomeasure double precision, leftrightoffset double precision) TO coptool;


--
-- TOC entry 6587 (class 0 OID 0)
-- Dependencies: 785
-- Name: FUNCTION st_locatebetweenelevations(geometry public.geometry, fromelevation double precision, toelevation double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_locatebetweenelevations(geometry public.geometry, fromelevation double precision, toelevation double precision) TO coptool;


--
-- TOC entry 6588 (class 0 OID 0)
-- Dependencies: 661
-- Name: FUNCTION st_longestline(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_longestline(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6589 (class 0 OID 0)
-- Dependencies: 323
-- Name: FUNCTION st_m(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_m(public.geometry) TO coptool;


--
-- TOC entry 6590 (class 0 OID 0)
-- Dependencies: 340
-- Name: FUNCTION st_makebox2d(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makebox2d(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6591 (class 0 OID 0)
-- Dependencies: 1099
-- Name: FUNCTION st_makebox3d(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makebox3d(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6592 (class 0 OID 0)
-- Dependencies: 1324
-- Name: FUNCTION st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makeenvelope(double precision, double precision, double precision, double precision, integer) TO coptool;


--
-- TOC entry 6593 (class 0 OID 0)
-- Dependencies: 407
-- Name: FUNCTION st_makeline(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makeline(public.geometry[]) TO coptool;


--
-- TOC entry 6594 (class 0 OID 0)
-- Dependencies: 408
-- Name: FUNCTION st_makeline(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makeline(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6595 (class 0 OID 0)
-- Dependencies: 1054
-- Name: FUNCTION st_makeline_garray(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makeline_garray(public.geometry[]) TO coptool;


--
-- TOC entry 6596 (class 0 OID 0)
-- Dependencies: 409
-- Name: FUNCTION st_makepoint(double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makepoint(double precision, double precision) TO coptool;


--
-- TOC entry 6597 (class 0 OID 0)
-- Dependencies: 410
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makepoint(double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6598 (class 0 OID 0)
-- Dependencies: 411
-- Name: FUNCTION st_makepoint(double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makepoint(double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6599 (class 0 OID 0)
-- Dependencies: 412
-- Name: FUNCTION st_makepointm(double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makepointm(double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6600 (class 0 OID 0)
-- Dependencies: 413
-- Name: FUNCTION st_makepolygon(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makepolygon(public.geometry) TO coptool;


--
-- TOC entry 6601 (class 0 OID 0)
-- Dependencies: 414
-- Name: FUNCTION st_makepolygon(public.geometry, public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makepolygon(public.geometry, public.geometry[]) TO coptool;


--
-- TOC entry 6602 (class 0 OID 0)
-- Dependencies: 515
-- Name: FUNCTION st_makevalid(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_makevalid(public.geometry) TO coptool;


--
-- TOC entry 6603 (class 0 OID 0)
-- Dependencies: 662
-- Name: FUNCTION st_maxdistance(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_maxdistance(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6604 (class 0 OID 0)
-- Dependencies: 504
-- Name: FUNCTION st_maximuminscribedcircle(public.geometry, OUT center public.geometry, OUT nearest public.geometry, OUT radius double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_maximuminscribedcircle(public.geometry, OUT center public.geometry, OUT nearest public.geometry, OUT radius double precision) TO coptool;


--
-- TOC entry 6605 (class 0 OID 0)
-- Dependencies: 1071
-- Name: FUNCTION st_mem_size(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mem_size(public.geometry) TO coptool;


--
-- TOC entry 6606 (class 0 OID 0)
-- Dependencies: 341
-- Name: FUNCTION st_memsize(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_memsize(public.geometry) TO coptool;


--
-- TOC entry 6607 (class 0 OID 0)
-- Dependencies: 505
-- Name: FUNCTION st_minimumboundingcircle(inputgeom public.geometry, segs_per_quarter integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_minimumboundingcircle(inputgeom public.geometry, segs_per_quarter integer) TO coptool;


--
-- TOC entry 6608 (class 0 OID 0)
-- Dependencies: 506
-- Name: FUNCTION st_minimumboundingradius(public.geometry, OUT center public.geometry, OUT radius double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_minimumboundingradius(public.geometry, OUT center public.geometry, OUT radius double precision) TO coptool;


--
-- TOC entry 6609 (class 0 OID 0)
-- Dependencies: 567
-- Name: FUNCTION st_minimumclearance(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_minimumclearance(public.geometry) TO coptool;


--
-- TOC entry 6610 (class 0 OID 0)
-- Dependencies: 590
-- Name: FUNCTION st_minimumclearanceline(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_minimumclearanceline(public.geometry) TO coptool;


--
-- TOC entry 6611 (class 0 OID 0)
-- Dependencies: 639
-- Name: FUNCTION st_mlinefromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mlinefromtext(text) TO coptool;


--
-- TOC entry 6612 (class 0 OID 0)
-- Dependencies: 1325
-- Name: FUNCTION st_mlinefromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mlinefromtext(text, integer) TO coptool;


--
-- TOC entry 6613 (class 0 OID 0)
-- Dependencies: 663
-- Name: FUNCTION st_mlinefromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mlinefromwkb(bytea) TO coptool;


--
-- TOC entry 6614 (class 0 OID 0)
-- Dependencies: 664
-- Name: FUNCTION st_mlinefromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mlinefromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6615 (class 0 OID 0)
-- Dependencies: 640
-- Name: FUNCTION st_mpointfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpointfromtext(text) TO coptool;


--
-- TOC entry 6616 (class 0 OID 0)
-- Dependencies: 641
-- Name: FUNCTION st_mpointfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpointfromtext(text, integer) TO coptool;


--
-- TOC entry 6617 (class 0 OID 0)
-- Dependencies: 665
-- Name: FUNCTION st_mpointfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpointfromwkb(bytea) TO coptool;


--
-- TOC entry 6618 (class 0 OID 0)
-- Dependencies: 666
-- Name: FUNCTION st_mpointfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpointfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6619 (class 0 OID 0)
-- Dependencies: 642
-- Name: FUNCTION st_mpolyfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpolyfromtext(text) TO coptool;


--
-- TOC entry 6620 (class 0 OID 0)
-- Dependencies: 643
-- Name: FUNCTION st_mpolyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpolyfromtext(text, integer) TO coptool;


--
-- TOC entry 6621 (class 0 OID 0)
-- Dependencies: 667
-- Name: FUNCTION st_mpolyfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpolyfromwkb(bytea) TO coptool;


--
-- TOC entry 6622 (class 0 OID 0)
-- Dependencies: 1326
-- Name: FUNCTION st_mpolyfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_mpolyfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6623 (class 0 OID 0)
-- Dependencies: 371
-- Name: FUNCTION st_multi(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multi(public.geometry) TO coptool;


--
-- TOC entry 6624 (class 0 OID 0)
-- Dependencies: 668
-- Name: FUNCTION st_multilinefromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multilinefromwkb(bytea) TO coptool;


--
-- TOC entry 6625 (class 0 OID 0)
-- Dependencies: 644
-- Name: FUNCTION st_multilinestringfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multilinestringfromtext(text) TO coptool;


--
-- TOC entry 6626 (class 0 OID 0)
-- Dependencies: 645
-- Name: FUNCTION st_multilinestringfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multilinestringfromtext(text, integer) TO coptool;


--
-- TOC entry 6627 (class 0 OID 0)
-- Dependencies: 646
-- Name: FUNCTION st_multipointfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipointfromtext(text) TO coptool;


--
-- TOC entry 6628 (class 0 OID 0)
-- Dependencies: 669
-- Name: FUNCTION st_multipointfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipointfromwkb(bytea) TO coptool;


--
-- TOC entry 6629 (class 0 OID 0)
-- Dependencies: 670
-- Name: FUNCTION st_multipointfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipointfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6630 (class 0 OID 0)
-- Dependencies: 671
-- Name: FUNCTION st_multipolyfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipolyfromwkb(bytea) TO coptool;


--
-- TOC entry 6631 (class 0 OID 0)
-- Dependencies: 672
-- Name: FUNCTION st_multipolyfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipolyfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6632 (class 0 OID 0)
-- Dependencies: 1288
-- Name: FUNCTION st_multipolygonfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipolygonfromtext(text) TO coptool;


--
-- TOC entry 6633 (class 0 OID 0)
-- Dependencies: 647
-- Name: FUNCTION st_multipolygonfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_multipolygonfromtext(text, integer) TO coptool;


--
-- TOC entry 6634 (class 0 OID 0)
-- Dependencies: 390
-- Name: FUNCTION st_ndims(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ndims(public.geometry) TO coptool;


--
-- TOC entry 6635 (class 0 OID 0)
-- Dependencies: 516
-- Name: FUNCTION st_node(g public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_node(g public.geometry) TO coptool;


--
-- TOC entry 6636 (class 0 OID 0)
-- Dependencies: 391
-- Name: FUNCTION st_normalize(geom public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_normalize(geom public.geometry) TO coptool;


--
-- TOC entry 6637 (class 0 OID 0)
-- Dependencies: 342
-- Name: FUNCTION st_npoints(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_npoints(public.geometry) TO coptool;


--
-- TOC entry 6638 (class 0 OID 0)
-- Dependencies: 343
-- Name: FUNCTION st_nrings(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_nrings(public.geometry) TO coptool;


--
-- TOC entry 6639 (class 0 OID 0)
-- Dependencies: 622
-- Name: FUNCTION st_numgeometries(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_numgeometries(public.geometry) TO coptool;


--
-- TOC entry 6640 (class 0 OID 0)
-- Dependencies: 623
-- Name: FUNCTION st_numinteriorring(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_numinteriorring(public.geometry) TO coptool;


--
-- TOC entry 6641 (class 0 OID 0)
-- Dependencies: 624
-- Name: FUNCTION st_numinteriorrings(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_numinteriorrings(public.geometry) TO coptool;


--
-- TOC entry 6642 (class 0 OID 0)
-- Dependencies: 625
-- Name: FUNCTION st_numpatches(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_numpatches(public.geometry) TO coptool;


--
-- TOC entry 6643 (class 0 OID 0)
-- Dependencies: 626
-- Name: FUNCTION st_numpoints(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_numpoints(public.geometry) TO coptool;


--
-- TOC entry 6644 (class 0 OID 0)
-- Dependencies: 1327
-- Name: FUNCTION st_offsetcurve(line public.geometry, distance double precision, params text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_offsetcurve(line public.geometry, distance double precision, params text) TO coptool;


--
-- TOC entry 6645 (class 0 OID 0)
-- Dependencies: 568
-- Name: FUNCTION st_orderingequals(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_orderingequals(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6646 (class 0 OID 0)
-- Dependencies: 507
-- Name: FUNCTION st_orientedenvelope(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_orientedenvelope(public.geometry) TO coptool;


--
-- TOC entry 6647 (class 0 OID 0)
-- Dependencies: 569
-- Name: FUNCTION st_overlaps(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_overlaps(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6648 (class 0 OID 0)
-- Dependencies: 627
-- Name: FUNCTION st_patchn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_patchn(public.geometry, integer) TO coptool;


--
-- TOC entry 6649 (class 0 OID 0)
-- Dependencies: 372
-- Name: FUNCTION st_perimeter(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_perimeter(public.geometry) TO coptool;


--
-- TOC entry 6650 (class 0 OID 0)
-- Dependencies: 1328
-- Name: FUNCTION st_perimeter(geog public.geography, use_spheroid boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_perimeter(geog public.geography, use_spheroid boolean) TO coptool;


--
-- TOC entry 6651 (class 0 OID 0)
-- Dependencies: 373
-- Name: FUNCTION st_perimeter2d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_perimeter2d(public.geometry) TO coptool;


--
-- TOC entry 6652 (class 0 OID 0)
-- Dependencies: 1100
-- Name: FUNCTION st_perimeter3d(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_perimeter3d(public.geometry) TO coptool;


--
-- TOC entry 6653 (class 0 OID 0)
-- Dependencies: 786
-- Name: FUNCTION st_point(double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_point(double precision, double precision) TO coptool;


--
-- TOC entry 6654 (class 0 OID 0)
-- Dependencies: 1329
-- Name: FUNCTION st_point_inside_circle(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_point_inside_circle(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6655 (class 0 OID 0)
-- Dependencies: 1330
-- Name: FUNCTION st_pointfromgeohash(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointfromgeohash(text, integer) TO coptool;


--
-- TOC entry 6656 (class 0 OID 0)
-- Dependencies: 628
-- Name: FUNCTION st_pointfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointfromtext(text) TO coptool;


--
-- TOC entry 6657 (class 0 OID 0)
-- Dependencies: 629
-- Name: FUNCTION st_pointfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointfromtext(text, integer) TO coptool;


--
-- TOC entry 6658 (class 0 OID 0)
-- Dependencies: 648
-- Name: FUNCTION st_pointfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointfromwkb(bytea) TO coptool;


--
-- TOC entry 6659 (class 0 OID 0)
-- Dependencies: 1331
-- Name: FUNCTION st_pointfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6660 (class 0 OID 0)
-- Dependencies: 374
-- Name: FUNCTION st_pointinsidecircle(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointinsidecircle(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6661 (class 0 OID 0)
-- Dependencies: 630
-- Name: FUNCTION st_pointn(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointn(public.geometry, integer) TO coptool;


--
-- TOC entry 6662 (class 0 OID 0)
-- Dependencies: 591
-- Name: FUNCTION st_pointonsurface(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_pointonsurface(public.geometry) TO coptool;


--
-- TOC entry 6663 (class 0 OID 0)
-- Dependencies: 508
-- Name: FUNCTION st_points(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_points(public.geometry) TO coptool;


--
-- TOC entry 6664 (class 0 OID 0)
-- Dependencies: 649
-- Name: FUNCTION st_polyfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polyfromtext(text) TO coptool;


--
-- TOC entry 6665 (class 0 OID 0)
-- Dependencies: 650
-- Name: FUNCTION st_polyfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polyfromtext(text, integer) TO coptool;


--
-- TOC entry 6666 (class 0 OID 0)
-- Dependencies: 651
-- Name: FUNCTION st_polyfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polyfromwkb(bytea) TO coptool;


--
-- TOC entry 6667 (class 0 OID 0)
-- Dependencies: 652
-- Name: FUNCTION st_polyfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polyfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6668 (class 0 OID 0)
-- Dependencies: 787
-- Name: FUNCTION st_polygon(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygon(public.geometry, integer) TO coptool;


--
-- TOC entry 6669 (class 0 OID 0)
-- Dependencies: 653
-- Name: FUNCTION st_polygonfromtext(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygonfromtext(text) TO coptool;


--
-- TOC entry 6670 (class 0 OID 0)
-- Dependencies: 654
-- Name: FUNCTION st_polygonfromtext(text, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygonfromtext(text, integer) TO coptool;


--
-- TOC entry 6671 (class 0 OID 0)
-- Dependencies: 673
-- Name: FUNCTION st_polygonfromwkb(bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygonfromwkb(bytea) TO coptool;


--
-- TOC entry 6672 (class 0 OID 0)
-- Dependencies: 1332
-- Name: FUNCTION st_polygonfromwkb(bytea, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygonfromwkb(bytea, integer) TO coptool;


--
-- TOC entry 6673 (class 0 OID 0)
-- Dependencies: 1333
-- Name: FUNCTION st_polygonize(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygonize(public.geometry[]) TO coptool;


--
-- TOC entry 6674 (class 0 OID 0)
-- Dependencies: 1101
-- Name: FUNCTION st_polygonize_garray(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_polygonize_garray(public.geometry[]) TO coptool;


--
-- TOC entry 6675 (class 0 OID 0)
-- Dependencies: 748
-- Name: FUNCTION st_project(geog public.geography, distance double precision, azimuth double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_project(geog public.geography, distance double precision, azimuth double precision) TO coptool;


--
-- TOC entry 6676 (class 0 OID 0)
-- Dependencies: 1334
-- Name: FUNCTION st_quantizecoordinates(g public.geometry, prec_x integer, prec_y integer, prec_z integer, prec_m integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_quantizecoordinates(g public.geometry, prec_x integer, prec_y integer, prec_z integer, prec_m integer) TO coptool;


--
-- TOC entry 6677 (class 0 OID 0)
-- Dependencies: 517
-- Name: FUNCTION st_reduceprecision(geom public.geometry, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_reduceprecision(geom public.geometry, gridsize double precision) TO coptool;


--
-- TOC entry 6678 (class 0 OID 0)
-- Dependencies: 543
-- Name: FUNCTION st_relate(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_relate(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6679 (class 0 OID 0)
-- Dependencies: 544
-- Name: FUNCTION st_relate(geom1 public.geometry, geom2 public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_relate(geom1 public.geometry, geom2 public.geometry, integer) TO coptool;


--
-- TOC entry 6680 (class 0 OID 0)
-- Dependencies: 545
-- Name: FUNCTION st_relate(geom1 public.geometry, geom2 public.geometry, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_relate(geom1 public.geometry, geom2 public.geometry, text) TO coptool;


--
-- TOC entry 6681 (class 0 OID 0)
-- Dependencies: 518
-- Name: FUNCTION st_relatematch(text, text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_relatematch(text, text) TO coptool;


--
-- TOC entry 6682 (class 0 OID 0)
-- Dependencies: 415
-- Name: FUNCTION st_removepoint(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_removepoint(public.geometry, integer) TO coptool;


--
-- TOC entry 6683 (class 0 OID 0)
-- Dependencies: 519
-- Name: FUNCTION st_removerepeatedpoints(geom public.geometry, tolerance double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_removerepeatedpoints(geom public.geometry, tolerance double precision) TO coptool;


--
-- TOC entry 6684 (class 0 OID 0)
-- Dependencies: 392
-- Name: FUNCTION st_reverse(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_reverse(public.geometry) TO coptool;


--
-- TOC entry 6685 (class 0 OID 0)
-- Dependencies: 416
-- Name: FUNCTION st_rotate(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_rotate(public.geometry, double precision) TO coptool;


--
-- TOC entry 6686 (class 0 OID 0)
-- Dependencies: 423
-- Name: FUNCTION st_rotate(public.geometry, double precision, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_rotate(public.geometry, double precision, public.geometry) TO coptool;


--
-- TOC entry 6687 (class 0 OID 0)
-- Dependencies: 424
-- Name: FUNCTION st_rotate(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_rotate(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6688 (class 0 OID 0)
-- Dependencies: 425
-- Name: FUNCTION st_rotatex(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_rotatex(public.geometry, double precision) TO coptool;


--
-- TOC entry 6689 (class 0 OID 0)
-- Dependencies: 426
-- Name: FUNCTION st_rotatey(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_rotatey(public.geometry, double precision) TO coptool;


--
-- TOC entry 6690 (class 0 OID 0)
-- Dependencies: 427
-- Name: FUNCTION st_rotatez(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_rotatez(public.geometry, double precision) TO coptool;


--
-- TOC entry 6691 (class 0 OID 0)
-- Dependencies: 428
-- Name: FUNCTION st_scale(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_scale(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6692 (class 0 OID 0)
-- Dependencies: 429
-- Name: FUNCTION st_scale(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_scale(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6693 (class 0 OID 0)
-- Dependencies: 430
-- Name: FUNCTION st_scale(public.geometry, public.geometry, origin public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_scale(public.geometry, public.geometry, origin public.geometry) TO coptool;


--
-- TOC entry 6694 (class 0 OID 0)
-- Dependencies: 431
-- Name: FUNCTION st_scale(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_scale(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6695 (class 0 OID 0)
-- Dependencies: 749
-- Name: FUNCTION st_segmentize(geog public.geography, max_segment_length double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_segmentize(geog public.geography, max_segment_length double precision) TO coptool;


--
-- TOC entry 6696 (class 0 OID 0)
-- Dependencies: 482
-- Name: FUNCTION st_segmentize(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_segmentize(public.geometry, double precision) TO coptool;


--
-- TOC entry 6697 (class 0 OID 0)
-- Dependencies: 1335
-- Name: FUNCTION st_seteffectivearea(public.geometry, double precision, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_seteffectivearea(public.geometry, double precision, integer) TO coptool;


--
-- TOC entry 6698 (class 0 OID 0)
-- Dependencies: 417
-- Name: FUNCTION st_setpoint(public.geometry, integer, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_setpoint(public.geometry, integer, public.geometry) TO coptool;


--
-- TOC entry 6699 (class 0 OID 0)
-- Dependencies: 750
-- Name: FUNCTION st_setsrid(geog public.geography, srid integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_setsrid(geog public.geography, srid integer) TO coptool;


--
-- TOC entry 6700 (class 0 OID 0)
-- Dependencies: 442
-- Name: FUNCTION st_setsrid(geom public.geometry, srid integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_setsrid(geom public.geometry, srid integer) TO coptool;


--
-- TOC entry 6701 (class 0 OID 0)
-- Dependencies: 520
-- Name: FUNCTION st_sharedpaths(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_sharedpaths(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6702 (class 0 OID 0)
-- Dependencies: 1072
-- Name: FUNCTION st_shift_longitude(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_shift_longitude(public.geometry) TO coptool;


--
-- TOC entry 6703 (class 0 OID 0)
-- Dependencies: 344
-- Name: FUNCTION st_shiftlongitude(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_shiftlongitude(public.geometry) TO coptool;


--
-- TOC entry 6704 (class 0 OID 0)
-- Dependencies: 1336
-- Name: FUNCTION st_shortestline(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_shortestline(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6705 (class 0 OID 0)
-- Dependencies: 483
-- Name: FUNCTION st_simplify(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_simplify(public.geometry, double precision) TO coptool;


--
-- TOC entry 6706 (class 0 OID 0)
-- Dependencies: 484
-- Name: FUNCTION st_simplify(public.geometry, double precision, boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_simplify(public.geometry, double precision, boolean) TO coptool;


--
-- TOC entry 6707 (class 0 OID 0)
-- Dependencies: 509
-- Name: FUNCTION st_simplifypreservetopology(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_simplifypreservetopology(public.geometry, double precision) TO coptool;


--
-- TOC entry 6708 (class 0 OID 0)
-- Dependencies: 485
-- Name: FUNCTION st_simplifyvw(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_simplifyvw(public.geometry, double precision) TO coptool;


--
-- TOC entry 6709 (class 0 OID 0)
-- Dependencies: 521
-- Name: FUNCTION st_snap(geom1 public.geometry, geom2 public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_snap(geom1 public.geometry, geom2 public.geometry, double precision) TO coptool;


--
-- TOC entry 6710 (class 0 OID 0)
-- Dependencies: 486
-- Name: FUNCTION st_snaptogrid(public.geometry, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_snaptogrid(public.geometry, double precision) TO coptool;


--
-- TOC entry 6711 (class 0 OID 0)
-- Dependencies: 487
-- Name: FUNCTION st_snaptogrid(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_snaptogrid(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6712 (class 0 OID 0)
-- Dependencies: 488
-- Name: FUNCTION st_snaptogrid(public.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_snaptogrid(public.geometry, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6713 (class 0 OID 0)
-- Dependencies: 489
-- Name: FUNCTION st_snaptogrid(geom1 public.geometry, geom2 public.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_snaptogrid(geom1 public.geometry, geom2 public.geometry, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6714 (class 0 OID 0)
-- Dependencies: 522
-- Name: FUNCTION st_split(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_split(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6715 (class 0 OID 0)
-- Dependencies: 1337
-- Name: FUNCTION st_square(size double precision, cell_i integer, cell_j integer, origin public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_square(size double precision, cell_i integer, cell_j integer, origin public.geometry) TO coptool;


--
-- TOC entry 6716 (class 0 OID 0)
-- Dependencies: 788
-- Name: FUNCTION st_squaregrid(size double precision, bounds public.geometry, OUT geom public.geometry, OUT i integer, OUT j integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_squaregrid(size double precision, bounds public.geometry, OUT geom public.geometry, OUT i integer, OUT j integer) TO coptool;


--
-- TOC entry 6717 (class 0 OID 0)
-- Dependencies: 751
-- Name: FUNCTION st_srid(geog public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_srid(geog public.geography) TO coptool;


--
-- TOC entry 6718 (class 0 OID 0)
-- Dependencies: 443
-- Name: FUNCTION st_srid(geom public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_srid(geom public.geometry) TO coptool;


--
-- TOC entry 6719 (class 0 OID 0)
-- Dependencies: 631
-- Name: FUNCTION st_startpoint(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_startpoint(public.geometry) TO coptool;


--
-- TOC entry 6720 (class 0 OID 0)
-- Dependencies: 523
-- Name: FUNCTION st_subdivide(geom public.geometry, maxvertices integer, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_subdivide(geom public.geometry, maxvertices integer, gridsize double precision) TO coptool;


--
-- TOC entry 6721 (class 0 OID 0)
-- Dependencies: 752
-- Name: FUNCTION st_summary(public.geography); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_summary(public.geography) TO coptool;


--
-- TOC entry 6722 (class 0 OID 0)
-- Dependencies: 345
-- Name: FUNCTION st_summary(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_summary(public.geometry) TO coptool;


--
-- TOC entry 6723 (class 0 OID 0)
-- Dependencies: 674
-- Name: FUNCTION st_swapordinates(geom public.geometry, ords cstring); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_swapordinates(geom public.geometry, ords cstring) TO coptool;


--
-- TOC entry 6724 (class 0 OID 0)
-- Dependencies: 510
-- Name: FUNCTION st_symdifference(geom1 public.geometry, geom2 public.geometry, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_symdifference(geom1 public.geometry, geom2 public.geometry, gridsize double precision) TO coptool;


--
-- TOC entry 6725 (class 0 OID 0)
-- Dependencies: 490
-- Name: FUNCTION st_symmetricdifference(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_symmetricdifference(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6726 (class 0 OID 0)
-- Dependencies: 1338
-- Name: FUNCTION st_text(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_text(public.geometry) TO coptool;


--
-- TOC entry 6727 (class 0 OID 0)
-- Dependencies: 1339
-- Name: FUNCTION st_tileenvelope(zoom integer, x integer, y integer, bounds public.geometry, margin double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_tileenvelope(zoom integer, x integer, y integer, bounds public.geometry, margin double precision) TO coptool;


--
-- TOC entry 6728 (class 0 OID 0)
-- Dependencies: 570
-- Name: FUNCTION st_touches(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_touches(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6729 (class 0 OID 0)
-- Dependencies: 444
-- Name: FUNCTION st_transform(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_transform(public.geometry, integer) TO coptool;


--
-- TOC entry 6730 (class 0 OID 0)
-- Dependencies: 445
-- Name: FUNCTION st_transform(geom public.geometry, to_proj text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_transform(geom public.geometry, to_proj text) TO coptool;


--
-- TOC entry 6731 (class 0 OID 0)
-- Dependencies: 466
-- Name: FUNCTION st_transform(geom public.geometry, from_proj text, to_srid integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_transform(geom public.geometry, from_proj text, to_srid integer) TO coptool;


--
-- TOC entry 6732 (class 0 OID 0)
-- Dependencies: 432
-- Name: FUNCTION st_transform(geom public.geometry, from_proj text, to_proj text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_transform(geom public.geometry, from_proj text, to_proj text) TO coptool;


--
-- TOC entry 6733 (class 0 OID 0)
-- Dependencies: 433
-- Name: FUNCTION st_translate(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_translate(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6734 (class 0 OID 0)
-- Dependencies: 434
-- Name: FUNCTION st_translate(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_translate(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6735 (class 0 OID 0)
-- Dependencies: 435
-- Name: FUNCTION st_transscale(public.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_transscale(public.geometry, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6736 (class 0 OID 0)
-- Dependencies: 524
-- Name: FUNCTION st_unaryunion(public.geometry, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_unaryunion(public.geometry, gridsize double precision) TO coptool;


--
-- TOC entry 6737 (class 0 OID 0)
-- Dependencies: 546
-- Name: FUNCTION st_union(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_union(public.geometry[]) TO coptool;


--
-- TOC entry 6738 (class 0 OID 0)
-- Dependencies: 525
-- Name: FUNCTION st_union(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_union(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6739 (class 0 OID 0)
-- Dependencies: 526
-- Name: FUNCTION st_union(geom1 public.geometry, geom2 public.geometry, gridsize double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_union(geom1 public.geometry, geom2 public.geometry, gridsize double precision) TO coptool;


--
-- TOC entry 6740 (class 0 OID 0)
-- Dependencies: 1102
-- Name: FUNCTION st_unite_garray(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_unite_garray(public.geometry[]) TO coptool;


--
-- TOC entry 6741 (class 0 OID 0)
-- Dependencies: 1340
-- Name: FUNCTION st_voronoilines(g1 public.geometry, tolerance double precision, extend_to public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_voronoilines(g1 public.geometry, tolerance double precision, extend_to public.geometry) TO coptool;


--
-- TOC entry 6742 (class 0 OID 0)
-- Dependencies: 527
-- Name: FUNCTION st_voronoipolygons(g1 public.geometry, tolerance double precision, extend_to public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_voronoipolygons(g1 public.geometry, tolerance double precision, extend_to public.geometry) TO coptool;


--
-- TOC entry 6743 (class 0 OID 0)
-- Dependencies: 1341
-- Name: FUNCTION st_within(geom1 public.geometry, geom2 public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_within(geom1 public.geometry, geom2 public.geometry) TO coptool;


--
-- TOC entry 6744 (class 0 OID 0)
-- Dependencies: 789
-- Name: FUNCTION st_wkbtosql(wkb bytea); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_wkbtosql(wkb bytea) TO coptool;


--
-- TOC entry 6745 (class 0 OID 0)
-- Dependencies: 632
-- Name: FUNCTION st_wkttosql(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_wkttosql(text) TO coptool;


--
-- TOC entry 6746 (class 0 OID 0)
-- Dependencies: 346
-- Name: FUNCTION st_wrapx(geom public.geometry, wrap double precision, move double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_wrapx(geom public.geometry, wrap double precision, move double precision) TO coptool;


--
-- TOC entry 6747 (class 0 OID 0)
-- Dependencies: 324
-- Name: FUNCTION st_x(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_x(public.geometry) TO coptool;


--
-- TOC entry 6748 (class 0 OID 0)
-- Dependencies: 347
-- Name: FUNCTION st_xmax(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_xmax(public.box3d) TO coptool;


--
-- TOC entry 6749 (class 0 OID 0)
-- Dependencies: 348
-- Name: FUNCTION st_xmin(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_xmin(public.box3d) TO coptool;


--
-- TOC entry 6750 (class 0 OID 0)
-- Dependencies: 325
-- Name: FUNCTION st_y(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_y(public.geometry) TO coptool;


--
-- TOC entry 6751 (class 0 OID 0)
-- Dependencies: 349
-- Name: FUNCTION st_ymax(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ymax(public.box3d) TO coptool;


--
-- TOC entry 6752 (class 0 OID 0)
-- Dependencies: 350
-- Name: FUNCTION st_ymin(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_ymin(public.box3d) TO coptool;


--
-- TOC entry 6753 (class 0 OID 0)
-- Dependencies: 326
-- Name: FUNCTION st_z(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_z(public.geometry) TO coptool;


--
-- TOC entry 6754 (class 0 OID 0)
-- Dependencies: 351
-- Name: FUNCTION st_zmax(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_zmax(public.box3d) TO coptool;


--
-- TOC entry 6755 (class 0 OID 0)
-- Dependencies: 393
-- Name: FUNCTION st_zmflag(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_zmflag(public.geometry) TO coptool;


--
-- TOC entry 6756 (class 0 OID 0)
-- Dependencies: 352
-- Name: FUNCTION st_zmin(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.st_zmin(public.box3d) TO coptool;


--
-- TOC entry 6757 (class 0 OID 0)
-- Dependencies: 1342
-- Name: FUNCTION startpoint(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.startpoint(public.geometry) TO coptool;


--
-- TOC entry 6758 (class 0 OID 0)
-- Dependencies: 1073
-- Name: FUNCTION summary(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.summary(public.geometry) TO coptool;


--
-- TOC entry 6759 (class 0 OID 0)
-- Dependencies: 1055
-- Name: FUNCTION symdifference(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.symdifference(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6760 (class 0 OID 0)
-- Dependencies: 1056
-- Name: FUNCTION symmetricdifference(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.symmetricdifference(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6761 (class 0 OID 0)
-- Dependencies: 491
-- Name: FUNCTION text(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.text(public.geometry) TO coptool;


--
-- TOC entry 6762 (class 0 OID 0)
-- Dependencies: 1074
-- Name: FUNCTION touches(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.touches(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6763 (class 0 OID 0)
-- Dependencies: 1075
-- Name: FUNCTION transform(public.geometry, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.transform(public.geometry, integer) TO coptool;


--
-- TOC entry 6764 (class 0 OID 0)
-- Dependencies: 929
-- Name: FUNCTION translate(public.geometry, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.translate(public.geometry, double precision, double precision) TO coptool;


--
-- TOC entry 6765 (class 0 OID 0)
-- Dependencies: 930
-- Name: FUNCTION translate(public.geometry, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.translate(public.geometry, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6766 (class 0 OID 0)
-- Dependencies: 1343
-- Name: FUNCTION transscale(public.geometry, double precision, double precision, double precision, double precision); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.transscale(public.geometry, double precision, double precision, double precision, double precision) TO coptool;


--
-- TOC entry 6767 (class 0 OID 0)
-- Dependencies: 1103
-- Name: FUNCTION unite_garray(public.geometry[]); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.unite_garray(public.geometry[]) TO coptool;


--
-- TOC entry 6768 (class 0 OID 0)
-- Dependencies: 685
-- Name: FUNCTION unlockrows(text); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.unlockrows(text) TO coptool;


--
-- TOC entry 6769 (class 0 OID 0)
-- Dependencies: 446
-- Name: FUNCTION updategeometrysrid(character varying, character varying, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.updategeometrysrid(character varying, character varying, integer) TO coptool;


--
-- TOC entry 6770 (class 0 OID 0)
-- Dependencies: 447
-- Name: FUNCTION updategeometrysrid(character varying, character varying, character varying, integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.updategeometrysrid(character varying, character varying, character varying, integer) TO coptool;


--
-- TOC entry 6771 (class 0 OID 0)
-- Dependencies: 1344
-- Name: FUNCTION updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.updategeometrysrid(catalogn_name character varying, schema_name character varying, table_name character varying, column_name character varying, new_srid_in integer) TO coptool;


--
-- TOC entry 6772 (class 0 OID 0)
-- Dependencies: 1345
-- Name: FUNCTION within(public.geometry, public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.within(public.geometry, public.geometry) TO coptool;


--
-- TOC entry 6773 (class 0 OID 0)
-- Dependencies: 1076
-- Name: FUNCTION x(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.x(public.geometry) TO coptool;


--
-- TOC entry 6774 (class 0 OID 0)
-- Dependencies: 1077
-- Name: FUNCTION xmax(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.xmax(public.box3d) TO coptool;


--
-- TOC entry 6775 (class 0 OID 0)
-- Dependencies: 1078
-- Name: FUNCTION xmin(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.xmin(public.box3d) TO coptool;


--
-- TOC entry 6776 (class 0 OID 0)
-- Dependencies: 1079
-- Name: FUNCTION y(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.y(public.geometry) TO coptool;


--
-- TOC entry 6777 (class 0 OID 0)
-- Dependencies: 1346
-- Name: FUNCTION ymax(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.ymax(public.box3d) TO coptool;


--
-- TOC entry 6778 (class 0 OID 0)
-- Dependencies: 1080
-- Name: FUNCTION ymin(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.ymin(public.box3d) TO coptool;


--
-- TOC entry 6779 (class 0 OID 0)
-- Dependencies: 1081
-- Name: FUNCTION z(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.z(public.geometry) TO coptool;


--
-- TOC entry 6780 (class 0 OID 0)
-- Dependencies: 1082
-- Name: FUNCTION zmax(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.zmax(public.box3d) TO coptool;


--
-- TOC entry 6781 (class 0 OID 0)
-- Dependencies: 1347
-- Name: FUNCTION zmflag(public.geometry); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.zmflag(public.geometry) TO coptool;


--
-- TOC entry 6782 (class 0 OID 0)
-- Dependencies: 1083
-- Name: FUNCTION zmin(public.box3d); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.zmin(public.box3d) TO coptool;


--
-- TOC entry 6783 (class 0 OID 0)
-- Dependencies: 1348
-- Name: FUNCTION _asgmledge(edge_id integer, start_node integer, end_node integer, line public.geometry, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology._asgmledge(edge_id integer, start_node integer, end_node integer, line public.geometry, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) TO coptool;


--
-- TOC entry 6784 (class 0 OID 0)
-- Dependencies: 1349
-- Name: FUNCTION _asgmlface(toponame text, face_id integer, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology._asgmlface(toponame text, face_id integer, visitedtable regclass, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) TO coptool;


--
-- TOC entry 6785 (class 0 OID 0)
-- Dependencies: 855
-- Name: FUNCTION _asgmlnode(id integer, point public.geometry, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology._asgmlnode(id integer, point public.geometry, nsprefix_in text, prec integer, options integer, idprefix text, gmlver integer) TO coptool;


--
-- TOC entry 6786 (class 0 OID 0)
-- Dependencies: 1350
-- Name: FUNCTION _st_adjacentedges(atopology character varying, anode integer, anedge integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology._st_adjacentedges(atopology character varying, anode integer, anedge integer) TO coptool;


--
-- TOC entry 6787 (class 0 OID 0)
-- Dependencies: 1351
-- Name: FUNCTION _st_mintolerance(ageom public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology._st_mintolerance(ageom public.geometry) TO coptool;


--
-- TOC entry 6788 (class 0 OID 0)
-- Dependencies: 1352
-- Name: FUNCTION _st_mintolerance(atopology character varying, ageom public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology._st_mintolerance(atopology character varying, ageom public.geometry) TO coptool;


--
-- TOC entry 6789 (class 0 OID 0)
-- Dependencies: 1353
-- Name: FUNCTION addedge(atopology character varying, aline public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addedge(atopology character varying, aline public.geometry) TO coptool;


--
-- TOC entry 6790 (class 0 OID 0)
-- Dependencies: 1354
-- Name: FUNCTION addface(atopology character varying, apoly public.geometry, force_new boolean); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addface(atopology character varying, apoly public.geometry, force_new boolean) TO coptool;


--
-- TOC entry 6791 (class 0 OID 0)
-- Dependencies: 822
-- Name: FUNCTION addnode(atopology character varying, apoint public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addnode(atopology character varying, apoint public.geometry) TO coptool;


--
-- TOC entry 6792 (class 0 OID 0)
-- Dependencies: 1355
-- Name: FUNCTION addnode(atopology character varying, apoint public.geometry, allowedgesplitting boolean, setcontainingface boolean); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addnode(atopology character varying, apoint public.geometry, allowedgesplitting boolean, setcontainingface boolean) TO coptool;


--
-- TOC entry 6793 (class 0 OID 0)
-- Dependencies: 823
-- Name: FUNCTION addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addtopogeometrycolumn(character varying, character varying, character varying, character varying, character varying) TO coptool;


--
-- TOC entry 6794 (class 0 OID 0)
-- Dependencies: 1356
-- Name: FUNCTION addtopogeometrycolumn(toponame character varying, schema character varying, tbl character varying, col character varying, ltype character varying, child integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addtopogeometrycolumn(toponame character varying, schema character varying, tbl character varying, col character varying, ltype character varying, child integer) TO coptool;


--
-- TOC entry 6795 (class 0 OID 0)
-- Dependencies: 1357
-- Name: FUNCTION addtosearchpath(a_schema_name character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.addtosearchpath(a_schema_name character varying) TO coptool;


--
-- TOC entry 6796 (class 0 OID 0)
-- Dependencies: 856
-- Name: FUNCTION asgml(tg topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry) TO coptool;


--
-- TOC entry 6797 (class 0 OID 0)
-- Dependencies: 857
-- Name: FUNCTION asgml(tg topology.topogeometry, visitedtable regclass); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, visitedtable regclass) TO coptool;


--
-- TOC entry 6798 (class 0 OID 0)
-- Dependencies: 858
-- Name: FUNCTION asgml(tg topology.topogeometry, nsprefix text); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, nsprefix text) TO coptool;


--
-- TOC entry 6799 (class 0 OID 0)
-- Dependencies: 859
-- Name: FUNCTION asgml(tg topology.topogeometry, visitedtable regclass, nsprefix text); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, visitedtable regclass, nsprefix text) TO coptool;


--
-- TOC entry 6800 (class 0 OID 0)
-- Dependencies: 860
-- Name: FUNCTION asgml(tg topology.topogeometry, nsprefix text, prec integer, opts integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, nsprefix text, prec integer, opts integer) TO coptool;


--
-- TOC entry 6801 (class 0 OID 0)
-- Dependencies: 861
-- Name: FUNCTION asgml(tg topology.topogeometry, nsprefix text, prec integer, options integer, vis regclass); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, nsprefix text, prec integer, options integer, vis regclass) TO coptool;


--
-- TOC entry 6802 (class 0 OID 0)
-- Dependencies: 862
-- Name: FUNCTION asgml(tg topology.topogeometry, nsprefix text, prec integer, options integer, visitedtable regclass, idprefix text); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, nsprefix text, prec integer, options integer, visitedtable regclass, idprefix text) TO coptool;


--
-- TOC entry 6803 (class 0 OID 0)
-- Dependencies: 863
-- Name: FUNCTION asgml(tg topology.topogeometry, nsprefix_in text, precision_in integer, options_in integer, visitedtable regclass, idprefix text, gmlver integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.asgml(tg topology.topogeometry, nsprefix_in text, precision_in integer, options_in integer, visitedtable regclass, idprefix text, gmlver integer) TO coptool;


--
-- TOC entry 6804 (class 0 OID 0)
-- Dependencies: 864
-- Name: FUNCTION astopojson(tg topology.topogeometry, edgemaptable regclass); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.astopojson(tg topology.topogeometry, edgemaptable regclass) TO coptool;


--
-- TOC entry 6805 (class 0 OID 0)
-- Dependencies: 1358
-- Name: FUNCTION cleartopogeom(tg topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.cleartopogeom(tg topology.topogeometry) TO coptool;


--
-- TOC entry 6806 (class 0 OID 0)
-- Dependencies: 842
-- Name: FUNCTION copytopology(atopology character varying, newtopo character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.copytopology(atopology character varying, newtopo character varying) TO coptool;


--
-- TOC entry 6807 (class 0 OID 0)
-- Dependencies: 825
-- Name: FUNCTION createtopogeom(toponame character varying, tg_type integer, layer_id integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.createtopogeom(toponame character varying, tg_type integer, layer_id integer) TO coptool;


--
-- TOC entry 6808 (class 0 OID 0)
-- Dependencies: 1359
-- Name: FUNCTION createtopogeom(toponame character varying, tg_type integer, layer_id integer, tg_objs topology.topoelementarray); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.createtopogeom(toponame character varying, tg_type integer, layer_id integer, tg_objs topology.topoelementarray) TO coptool;


--
-- TOC entry 6809 (class 0 OID 0)
-- Dependencies: 1360
-- Name: FUNCTION createtopology(character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.createtopology(character varying) TO coptool;


--
-- TOC entry 6810 (class 0 OID 0)
-- Dependencies: 833
-- Name: FUNCTION createtopology(character varying, integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.createtopology(character varying, integer) TO coptool;


--
-- TOC entry 6811 (class 0 OID 0)
-- Dependencies: 834
-- Name: FUNCTION createtopology(toponame character varying, srid integer, prec double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.createtopology(toponame character varying, srid integer, prec double precision) TO coptool;


--
-- TOC entry 6812 (class 0 OID 0)
-- Dependencies: 835
-- Name: FUNCTION createtopology(atopology character varying, srid integer, prec double precision, hasz boolean); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.createtopology(atopology character varying, srid integer, prec double precision, hasz boolean) TO coptool;


--
-- TOC entry 6813 (class 0 OID 0)
-- Dependencies: 826
-- Name: FUNCTION droptopogeometrycolumn(schema character varying, tbl character varying, col character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.droptopogeometrycolumn(schema character varying, tbl character varying, col character varying) TO coptool;


--
-- TOC entry 6814 (class 0 OID 0)
-- Dependencies: 1361
-- Name: FUNCTION droptopology(atopology character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.droptopology(atopology character varying) TO coptool;


--
-- TOC entry 6815 (class 0 OID 0)
-- Dependencies: 1362
-- Name: FUNCTION equals(tg1 topology.topogeometry, tg2 topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.equals(tg1 topology.topogeometry, tg2 topology.topogeometry) TO coptool;


--
-- TOC entry 6816 (class 0 OID 0)
-- Dependencies: 1363
-- Name: FUNCTION geometry(topogeom topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.geometry(topogeom topology.topogeometry) TO coptool;


--
-- TOC entry 6817 (class 0 OID 0)
-- Dependencies: 847
-- Name: FUNCTION geometrytype(tg topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.geometrytype(tg topology.topogeometry) TO coptool;


--
-- TOC entry 6818 (class 0 OID 0)
-- Dependencies: 843
-- Name: FUNCTION getedgebypoint(atopology character varying, apoint public.geometry, tol1 double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.getedgebypoint(atopology character varying, apoint public.geometry, tol1 double precision) TO coptool;


--
-- TOC entry 6819 (class 0 OID 0)
-- Dependencies: 844
-- Name: FUNCTION getfacebypoint(atopology character varying, apoint public.geometry, tol1 double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.getfacebypoint(atopology character varying, apoint public.geometry, tol1 double precision) TO coptool;


--
-- TOC entry 6820 (class 0 OID 0)
-- Dependencies: 845
-- Name: FUNCTION getnodebypoint(atopology character varying, apoint public.geometry, tol1 double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.getnodebypoint(atopology character varying, apoint public.geometry, tol1 double precision) TO coptool;


--
-- TOC entry 6821 (class 0 OID 0)
-- Dependencies: 903
-- Name: FUNCTION getnodeedges(atopology character varying, anode integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.getnodeedges(atopology character varying, anode integer) TO coptool;


--
-- TOC entry 6822 (class 0 OID 0)
-- Dependencies: 868
-- Name: FUNCTION getringedges(atopology character varying, anedge integer, maxedges integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.getringedges(atopology character varying, anedge integer, maxedges integer) TO coptool;


--
-- TOC entry 6823 (class 0 OID 0)
-- Dependencies: 827
-- Name: FUNCTION gettopogeomelementarray(tg topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopogeomelementarray(tg topology.topogeometry) TO coptool;


--
-- TOC entry 6824 (class 0 OID 0)
-- Dependencies: 828
-- Name: FUNCTION gettopogeomelementarray(toponame character varying, layer_id integer, tgid integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopogeomelementarray(toponame character varying, layer_id integer, tgid integer) TO coptool;


--
-- TOC entry 6825 (class 0 OID 0)
-- Dependencies: 836
-- Name: FUNCTION gettopogeomelements(tg topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopogeomelements(tg topology.topogeometry) TO coptool;


--
-- TOC entry 6826 (class 0 OID 0)
-- Dependencies: 837
-- Name: FUNCTION gettopogeomelements(toponame character varying, layerid integer, tgid integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopogeomelements(toponame character varying, layerid integer, tgid integer) TO coptool;


--
-- TOC entry 6827 (class 0 OID 0)
-- Dependencies: 829
-- Name: FUNCTION gettopologyid(toponame character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopologyid(toponame character varying) TO coptool;


--
-- TOC entry 6828 (class 0 OID 0)
-- Dependencies: 830
-- Name: FUNCTION gettopologyname(topoid integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopologyname(topoid integer) TO coptool;


--
-- TOC entry 6829 (class 0 OID 0)
-- Dependencies: 831
-- Name: FUNCTION gettopologysrid(toponame character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.gettopologysrid(toponame character varying) TO coptool;


--
-- TOC entry 6830 (class 0 OID 0)
-- Dependencies: 846
-- Name: FUNCTION intersects(tg1 topology.topogeometry, tg2 topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.intersects(tg1 topology.topogeometry, tg2 topology.topogeometry) TO coptool;


--
-- TOC entry 6831 (class 0 OID 0)
-- Dependencies: 824
-- Name: FUNCTION layertrigger(); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.layertrigger() TO coptool;


--
-- TOC entry 6832 (class 0 OID 0)
-- Dependencies: 1364
-- Name: FUNCTION polygonize(toponame character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.polygonize(toponame character varying) TO coptool;


--
-- TOC entry 6833 (class 0 OID 0)
-- Dependencies: 1365
-- Name: FUNCTION populate_topology_layer(); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.populate_topology_layer() TO coptool;


--
-- TOC entry 6834 (class 0 OID 0)
-- Dependencies: 904
-- Name: FUNCTION postgis_topology_scripts_installed(); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.postgis_topology_scripts_installed() TO coptool;


--
-- TOC entry 6835 (class 0 OID 0)
-- Dependencies: 1366
-- Name: FUNCTION relationtrigger(); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.relationtrigger() TO coptool;


--
-- TOC entry 6836 (class 0 OID 0)
-- Dependencies: 869
-- Name: FUNCTION st_addedgemodface(atopology character varying, anode integer, anothernode integer, acurve public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_addedgemodface(atopology character varying, anode integer, anothernode integer, acurve public.geometry) TO coptool;


--
-- TOC entry 6837 (class 0 OID 0)
-- Dependencies: 870
-- Name: FUNCTION st_addedgenewfaces(atopology character varying, anode integer, anothernode integer, acurve public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_addedgenewfaces(atopology character varying, anode integer, anothernode integer, acurve public.geometry) TO coptool;


--
-- TOC entry 6838 (class 0 OID 0)
-- Dependencies: 871
-- Name: FUNCTION st_addisoedge(atopology character varying, anode integer, anothernode integer, acurve public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_addisoedge(atopology character varying, anode integer, anothernode integer, acurve public.geometry) TO coptool;


--
-- TOC entry 6839 (class 0 OID 0)
-- Dependencies: 872
-- Name: FUNCTION st_addisonode(atopology character varying, aface integer, apoint public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_addisonode(atopology character varying, aface integer, apoint public.geometry) TO coptool;


--
-- TOC entry 6840 (class 0 OID 0)
-- Dependencies: 873
-- Name: FUNCTION st_changeedgegeom(atopology character varying, anedge integer, acurve public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_changeedgegeom(atopology character varying, anedge integer, acurve public.geometry) TO coptool;


--
-- TOC entry 6841 (class 0 OID 0)
-- Dependencies: 1367
-- Name: FUNCTION st_createtopogeo(atopology character varying, acollection public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_createtopogeo(atopology character varying, acollection public.geometry) TO coptool;


--
-- TOC entry 6842 (class 0 OID 0)
-- Dependencies: 848
-- Name: FUNCTION st_geometrytype(tg topology.topogeometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_geometrytype(tg topology.topogeometry) TO coptool;


--
-- TOC entry 6843 (class 0 OID 0)
-- Dependencies: 849
-- Name: FUNCTION st_getfaceedges(toponame character varying, face_id integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_getfaceedges(toponame character varying, face_id integer) TO coptool;


--
-- TOC entry 6844 (class 0 OID 0)
-- Dependencies: 874
-- Name: FUNCTION st_getfacegeometry(toponame character varying, aface integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_getfacegeometry(toponame character varying, aface integer) TO coptool;


--
-- TOC entry 6845 (class 0 OID 0)
-- Dependencies: 875
-- Name: FUNCTION st_inittopogeo(atopology character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_inittopogeo(atopology character varying) TO coptool;


--
-- TOC entry 6846 (class 0 OID 0)
-- Dependencies: 850
-- Name: FUNCTION st_modedgeheal(toponame character varying, e1id integer, e2id integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_modedgeheal(toponame character varying, e1id integer, e2id integer) TO coptool;


--
-- TOC entry 6847 (class 0 OID 0)
-- Dependencies: 876
-- Name: FUNCTION st_modedgesplit(atopology character varying, anedge integer, apoint public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_modedgesplit(atopology character varying, anedge integer, apoint public.geometry) TO coptool;


--
-- TOC entry 6848 (class 0 OID 0)
-- Dependencies: 877
-- Name: FUNCTION st_moveisonode(atopology character varying, anode integer, apoint public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_moveisonode(atopology character varying, anode integer, apoint public.geometry) TO coptool;


--
-- TOC entry 6849 (class 0 OID 0)
-- Dependencies: 851
-- Name: FUNCTION st_newedgeheal(toponame character varying, e1id integer, e2id integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_newedgeheal(toponame character varying, e1id integer, e2id integer) TO coptool;


--
-- TOC entry 6850 (class 0 OID 0)
-- Dependencies: 878
-- Name: FUNCTION st_newedgessplit(atopology character varying, anedge integer, apoint public.geometry); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_newedgessplit(atopology character varying, anedge integer, apoint public.geometry) TO coptool;


--
-- TOC entry 6851 (class 0 OID 0)
-- Dependencies: 879
-- Name: FUNCTION st_remedgemodface(toponame character varying, e1id integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_remedgemodface(toponame character varying, e1id integer) TO coptool;


--
-- TOC entry 6852 (class 0 OID 0)
-- Dependencies: 838
-- Name: FUNCTION st_remedgenewface(toponame character varying, e1id integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_remedgenewface(toponame character varying, e1id integer) TO coptool;


--
-- TOC entry 6853 (class 0 OID 0)
-- Dependencies: 880
-- Name: FUNCTION st_remisonode(character varying, integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_remisonode(character varying, integer) TO coptool;


--
-- TOC entry 6854 (class 0 OID 0)
-- Dependencies: 881
-- Name: FUNCTION st_removeisoedge(atopology character varying, anedge integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_removeisoedge(atopology character varying, anedge integer) TO coptool;


--
-- TOC entry 6855 (class 0 OID 0)
-- Dependencies: 882
-- Name: FUNCTION st_removeisonode(atopology character varying, anode integer); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_removeisonode(atopology character varying, anode integer) TO coptool;


--
-- TOC entry 6856 (class 0 OID 0)
-- Dependencies: 1368
-- Name: FUNCTION st_simplify(tg topology.topogeometry, tolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.st_simplify(tg topology.topogeometry, tolerance double precision) TO coptool;


--
-- TOC entry 6857 (class 0 OID 0)
-- Dependencies: 852
-- Name: FUNCTION topoelementarray_append(topology.topoelementarray, topology.topoelement); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topoelementarray_append(topology.topoelementarray, topology.topoelement) TO coptool;


--
-- TOC entry 6858 (class 0 OID 0)
-- Dependencies: 853
-- Name: FUNCTION topogeo_addgeometry(atopology character varying, ageom public.geometry, tolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topogeo_addgeometry(atopology character varying, ageom public.geometry, tolerance double precision) TO coptool;


--
-- TOC entry 6859 (class 0 OID 0)
-- Dependencies: 839
-- Name: FUNCTION topogeo_addlinestring(atopology character varying, aline public.geometry, tolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topogeo_addlinestring(atopology character varying, aline public.geometry, tolerance double precision) TO coptool;


--
-- TOC entry 6860 (class 0 OID 0)
-- Dependencies: 832
-- Name: FUNCTION topogeo_addpoint(atopology character varying, apoint public.geometry, tolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topogeo_addpoint(atopology character varying, apoint public.geometry, tolerance double precision) TO coptool;


--
-- TOC entry 6861 (class 0 OID 0)
-- Dependencies: 840
-- Name: FUNCTION topogeo_addpolygon(atopology character varying, apoly public.geometry, tolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topogeo_addpolygon(atopology character varying, apoly public.geometry, tolerance double precision) TO coptool;


--
-- TOC entry 6862 (class 0 OID 0)
-- Dependencies: 865
-- Name: FUNCTION topogeom_addelement(tg topology.topogeometry, el topology.topoelement); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topogeom_addelement(tg topology.topogeometry, el topology.topoelement) TO coptool;


--
-- TOC entry 6863 (class 0 OID 0)
-- Dependencies: 866
-- Name: FUNCTION topogeom_remelement(tg topology.topogeometry, el topology.topoelement); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topogeom_remelement(tg topology.topogeometry, el topology.topoelement) TO coptool;


--
-- TOC entry 6864 (class 0 OID 0)
-- Dependencies: 1369
-- Name: FUNCTION topologysummary(atopology character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.topologysummary(atopology character varying) TO coptool;


--
-- TOC entry 6865 (class 0 OID 0)
-- Dependencies: 854
-- Name: FUNCTION totopogeom(ageom public.geometry, tg topology.topogeometry, atolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.totopogeom(ageom public.geometry, tg topology.topogeometry, atolerance double precision) TO coptool;


--
-- TOC entry 6866 (class 0 OID 0)
-- Dependencies: 1370
-- Name: FUNCTION totopogeom(ageom public.geometry, atopology character varying, alayer integer, atolerance double precision); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.totopogeom(ageom public.geometry, atopology character varying, alayer integer, atolerance double precision) TO coptool;


--
-- TOC entry 6867 (class 0 OID 0)
-- Dependencies: 841
-- Name: FUNCTION validatetopology(toponame character varying); Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON FUNCTION topology.validatetopology(toponame character varying) TO coptool;


--
-- TOC entry 6868 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE asset; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.asset TO coptool;


--
-- TOC entry 6869 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE bookmark; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.bookmark TO coptool;


--
-- TOC entry 6870 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE comment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.comment TO coptool;


--
-- TOC entry 6871 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE configparams; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.configparams TO coptool;


--
-- TOC entry 6872 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE episode; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.episode TO coptool;


--
-- TOC entry 6873 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE episode_layer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.episode_layer TO coptool;


--
-- TOC entry 6874 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE episode_observer; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.episode_observer TO coptool;


--
-- TOC entry 6875 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE episode_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.episode_user TO coptool;


--
-- TOC entry 6876 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE episode_user_layers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.episode_user_layers TO coptool;


--
-- TOC entry 6877 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE file_geometry; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.file_geometry TO coptool;


--
-- TOC entry 6878 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE file_record; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.file_record TO coptool;


--
-- TOC entry 6879 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE geography_columns; Type: ACL; Schema: public; Owner: postgres
--

REVOKE SELECT ON TABLE public.geography_columns FROM PUBLIC;
GRANT ALL ON TABLE public.geography_columns TO PUBLIC;
GRANT ALL ON TABLE public.geography_columns TO coptool;


--
-- TOC entry 6880 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE geometry_columns; Type: ACL; Schema: public; Owner: postgres
--

REVOKE SELECT ON TABLE public.geometry_columns FROM PUBLIC;
GRANT ALL ON TABLE public.geometry_columns TO PUBLIC;
GRANT ALL ON TABLE public.geometry_columns TO coptool;


--
-- TOC entry 6881 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE gis_asset; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.gis_asset TO coptool;


--
-- TOC entry 6882 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE gis_layout; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.gis_layout TO coptool;


--
-- TOC entry 6883 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE layer_filter; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.layer_filter TO coptool;


--
-- TOC entry 6884 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE layer_group; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.layer_group TO coptool;


--
-- TOC entry 6885 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE layeracp; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.layeracp TO coptool;


--
-- TOC entry 6886 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE logbookrecord; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.logbookrecord TO coptool;


--
-- TOC entry 6887 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE measurement; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.measurement TO coptool;


--
-- TOC entry 6888 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE measurement_device; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.measurement_device TO coptool;


--
-- TOC entry 6889 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE note; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.note TO coptool;


--
-- TOC entry 6890 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE other_substance; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.other_substance TO coptool;


--
-- TOC entry 6891 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE panel; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.panel TO coptool;


--
-- TOC entry 6892 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE photo; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.photo TO coptool;


--
-- TOC entry 6893 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE pollutant; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pollutant TO coptool;


--
-- TOC entry 6894 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE pollution_episode; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pollution_episode TO coptool;


--
-- TOC entry 6895 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE pollution_episode_segment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pollution_episode_segment TO coptool;


--
-- TOC entry 6896 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE pollution_report; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pollution_report TO coptool;


--
-- TOC entry 6897 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE pollution_source; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.pollution_source TO coptool;


--
-- TOC entry 6898 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE report; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.report TO coptool;


--
-- TOC entry 6899 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE report_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.report_user TO coptool;


--
-- TOC entry 6900 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE scat_report; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report TO coptool;


--
-- TOC entry 6901 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE scat_report_algaes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_algaes TO coptool;


--
-- TOC entry 6902 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE scat_report_conservation; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_conservation TO coptool;


--
-- TOC entry 6903 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE scat_report_contacts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_contacts TO coptool;


--
-- TOC entry 6904 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE scat_report_debrises; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_debrises TO coptool;


--
-- TOC entry 6905 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE scat_report_direct_backshore_access; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_direct_backshore_access TO coptool;


--
-- TOC entry 6906 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE scat_report_local_features; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_local_features TO coptool;


--
-- TOC entry 6907 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE scat_report_neighbour_segment_access; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_neighbour_segment_access TO coptool;


--
-- TOC entry 6908 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE scat_report_oiled_faunas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_oiled_faunas TO coptool;


--
-- TOC entry 6909 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE scat_report_shoreline_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_shoreline_types TO coptool;


--
-- TOC entry 6910 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE scat_report_uses; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_report_uses TO coptool;


--
-- TOC entry 6911 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE scat_zone; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.scat_zone TO coptool;


--
-- TOC entry 6912 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE segment; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.segment TO coptool;


--
-- TOC entry 6913 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE spatial_ref_sys; Type: ACL; Schema: public; Owner: postgres
--

REVOKE SELECT ON TABLE public.spatial_ref_sys FROM PUBLIC;
GRANT ALL ON TABLE public.spatial_ref_sys TO PUBLIC;
GRANT ALL ON TABLE public.spatial_ref_sys TO coptool;


--
-- TOC entry 6914 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE spill; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.spill TO coptool;


--
-- TOC entry 6915 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE spill_polrep; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.spill_polrep TO coptool;


--
-- TOC entry 6916 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE subsurface_oil_condition; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subsurface_oil_condition TO coptool;


--
-- TOC entry 6917 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE subsurface_oil_condition_sediment_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.subsurface_oil_condition_sediment_types TO coptool;


--
-- TOC entry 6918 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE surface_oil_condition; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.surface_oil_condition TO coptool;


--
-- TOC entry 6919 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE user_login; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_login TO coptool;


--
-- TOC entry 6920 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE user_login_layer_groups; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_login_layer_groups TO coptool;


--
-- TOC entry 6921 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE userlogin_userauthorities; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.userlogin_userauthorities TO coptool;


--
-- TOC entry 6922 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE userrole; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.userrole TO coptool;


--
-- TOC entry 6923 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE userrole_authorities; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.userrole_authorities TO coptool;


--
-- TOC entry 6924 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE layer; Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON TABLE topology.layer TO coptool;


--
-- TOC entry 6925 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE topology; Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON TABLE topology.topology TO coptool;


--
-- TOC entry 6926 (class 0 OID 0)
-- Dependencies: 218
-- Name: SEQUENCE topology_id_seq; Type: ACL; Schema: topology; Owner: postgres
--

GRANT ALL ON SEQUENCE topology.topology_id_seq TO coptool;


-- Completed on 2023-01-27 13:18:19

--
-- PostgreSQL database dump complete
--

