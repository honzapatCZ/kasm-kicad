FROM kasmweb/core-ubuntu-focal:1.11.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

RUN  add-apt-repository --yes ppa:kicad/kicad-6.0-releases \
    && apt-get update \
    && apt install --install-recommends kicad \
    && cp /usr/share/applications/org.kicad.bitmap2component.desktop $HOME/Desktop/ \
    && cp /usr/share/applications/org.kicad.eeschema.desktop $HOME/Desktop/ \
    && cp /usr/share/applications/org.kicad.gerbview.desktop $HOME/Desktop/ \
    && cp /usr/share/applications/org.kicad.kicad.desktop $HOME/Desktop/ \
    && cp /usr/share/applications/org.kicad.pcbcalculator.desktop $HOME/Desktop/ \
    && cp /usr/share/applications/org.kicad.pcbnew.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/org.kicad.bitmap2component.desktop \
    && chmod +x $HOME/Desktop/org.kicad.eeschema.desktop \
    && chmod +x $HOME/Desktop/org.kicad.gerbview.desktop \
    && chmod +x $HOME/Desktop/org.kicad.kicad.desktop \
    && chmod +x $HOME/Desktop/org.kicad.pcbcalculator.desktop \
    && chmod +x $HOME/Desktop/org.kicad.pcbnew.desktop \
    && chown 1000:1000 $HOME/Desktop/org.kicad.bitmap2component.desktop
    && chown 1000:1000 $HOME/Desktop/org.kicad.eeschema.desktop
    && chown 1000:1000 $HOME/Desktop/org.kicad.gerbview.desktop
    && chown 1000:1000 $HOME/Desktop/org.kicad.kicad.desktop
    && chown 1000:1000 $HOME/Desktop/org.kicad.pcbcalculator.desktop
    && chown 1000:1000 $HOME/Desktop/org.kicad.pcbnew.desktop


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
