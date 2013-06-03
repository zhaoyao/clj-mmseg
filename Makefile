
MMSEG4J_GIT="git@github.com:zhuomingliang/mmseg4j.git"

MMSEG4J_BUILD="mmseg4j_temp"

LOCAL_REPO="lib"

MMSEG4J_VERSION="1.8.5"

LOCAL_MVN_CACHE="~/.m2/repository/mmseg4j"

all: clean git-clone build_mmseg4j install clean-m2-cache

install:
	mkdir -p $(LOCAL_REPO)
	mvn install:install-file -DgroupId=mmseg4j \
							 -DartifactId=mmseg4j \
							 -Dversion=$(MMSEG4J_VERSION) \
							 -Dpackaging=jar \
							 -DgeneratePom=true \
							 -Dfile=$(MMSEG4J_BUILD)/build/mmseg4j-all-1.8.5-with-dic.jar \
							 -DcreateChecksum=true \
							 -DlocalRepositoryPath=lib
	rm -rf $(MMSEG4J_BUILD)

# clear the local maven cache for mmseg4j 
clean-m2-cache:
	rm -rf $(LOCAL_MVN_CACHE)

git-clone:
	git clone $(MMSEG4J_GIT) $(MMSEG4J_BUILD)

build_mmseg4j:
	cd $(MMSEG4J_BUILD) && ant jar-with-dic

clean:
	rm -rf $(LOCAL_REPO) $(MMSEG4J_BUILD)

