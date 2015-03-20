echo "Installing Fuseki"

FUSEKI_VERSION=1.1.2
FUSEKI_HOME=/usr/share/fuseki

mkdir $FUSEKI_HOME

cd /tmp
echo -n "Downloading Fuseki..."
wget -q http://www.apache.org/dist/jena/binaries/jena-fuseki1-"$FUSEKI_VERSION"-distribution.tar.gz
echo " done"
tar -xzvf jena-fuseki1-"$FUSEKI_VERSION"-distribution.tar.gz
cd jena-fuseki1-"$FUSEKI_VERSION"
mv -v * $FUSEKI_HOME
chown -hR tomcat7:tomcat7 $FUSEKI_HOME

mkdir "$FUSEKI_HOME/test_data"
ln -s $FUSEKI_HOME/fuseki /etc/init.d
echo 'FUSEKI_HOME="$FUSEKI_HOME"' > /etc/default/fuseki
echo "FUSEKI_ARGS=\"--update --mem /test\"" >> /etc/default/fuseki

/etc/init.d/fuseki start

