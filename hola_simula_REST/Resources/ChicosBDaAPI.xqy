xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://TargetNamespace.com/chicosAPI_getChicos_response";
(:: import schema at "../ProxyService/chicos.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/top/chicos";
(:: import schema at "../BusinessService/chicos_table.xsd" ::)

declare variable $chicosBD as element() (:: schema-element(ns1:ChicosCollection) ::) external;

declare function local:func($chicosBD as element() (:: schema-element(ns1:ChicosCollection) ::)) as element() (:: schema-element(ns2:Root-Element) ::) {
    <ns2:Root-Element>
        {
            for $Chicos in $chicosBD/ns1:Chicos
            return 
            <ns2:Chicos>
                <ns2:id>{fn:data($Chicos/ns1:id)}</ns2:id>
                <ns2:nombre>{fn:data($Chicos/ns1:nombre)}</ns2:nombre>
                <ns2:apodo>{fn:data($Chicos/ns1:apodo)}</ns2:apodo></ns2:Chicos>
        }
    </ns2:Root-Element>
};

local:func($chicosBD)
