/*
 *  SPDX-FileCopyrightText: 2026 catpswin56 <catpswin5@proton.me>
 *
 *  SPDX-License-Identifier: AGPL-3.0-or-later
 */

#ifndef AEROSHELLSDDM_H
#define AEROSHELLSDDM_H

#include <QObject>
#include <qqmlintegration.h>

#include <KSharedConfig>

class SDDM : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT

    Q_PROPERTY(QString currentSDDMTheme READ currentSDDMTheme NOTIFY currentSDDMThemeChanged)

public:
    explicit SDDM(QObject *parent = nullptr);
    ~SDDM() override;

    QString currentSDDMTheme();

Q_SIGNALS:
    void currentSDDMThemeChanged(QString previous);

private:
    KSharedConfig::Ptr m_cfg;
    QString m_currentSDDMTheme{};

};

#endif
