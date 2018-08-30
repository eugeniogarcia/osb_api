xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/chicosAPI_getChicos_response";
(:: import schema at "../ProxyService/chicos.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/chicos";
(:: import schema at "../BusinessService/chicos_table.xsd" ::)

declare variable $entrada as element() (:: schema-element(ns2:Root-Element) ::) external;

declare function local:func($entrada as element() (:: schema-element(ns2:Root-Element) ::)) as element() (:: schema-element(ns1:ChicosCollection) ::) {
    <ns1:ChicosCollection>
        {
            for $Chicos in $entrada/ns2:Chicos
            return 
            <ns1:Chicos>
                <ns1:id>{fn:data($Chicos/ns2:id)}</ns1:id>
                <ns1:nombre>{fn:data($Chicos/ns2:nombre)}</ns1:nombre>
                <ns1:apodo>{fn:data($Chicos/ns2:apodo)}</ns1:apodo></ns1:Chicos>
        }
    </ns1:ChicosCollection>
};

local:func($entrada)
